//
//  MapViewController.swift
//  PicSpot
//
//  Created by jun on 2022/10/06.
//

import UIKit
import NMapsMap
import FirebaseStorage

// 초기 화면 설정값. 한국 전체가 보이도록 설정함 (울릉도, 독도 ㅠㅠ)
public let defaultPosition = NMFCameraPosition(
    NMGLatLng(lat: 35.730827, lng: 127.756850),
    zoom: 6,
    tilt: 0,
    heading: 0
)

struct Picture {
    let fileName: String
    let lat: Double
    let lng: Double
    let like: Int
    var image: UIImage?
}

// juhur todo 동작확인을 위한 더미데이터. DB 구성 후 삭제 예정
let pictures: [Picture] = [
    Picture(fileName: "dangjin.jpeg", lat: 36.888324, lng: 126.821865, like: 1, image: nil),        // 당진
    Picture(fileName: "42.png", lat: 37.491688, lng: 127.031095, like: 2, image: nil),              // 서초클
    Picture(fileName: "home.png", lat: 37.458631, lng: 126.879375, like: 3, image: nil),            // 광명
    Picture(fileName: "chitterlings.jpeg", lat: 37.478512, lng: 126.934646, like: 4, image: nil),   // 신풍루 곱창구이
    Picture(fileName: "naver.jpeg", lat: 37.358823573473316, lng: 127.104692, like: 5, image: nil), // 네이버

    Picture(fileName: "dangjin.jpeg", lat: 34.811940, lng: 126.371047, like: 6, image: nil),        // 목포
    Picture(fileName: "42.png", lat: 34.616691, lng: 126.637252, like: 7, image: nil),              // 제천
    Picture(fileName: "home.png", lat: 35.811659, lng: 128.289284, like: 8, image: nil),            // 대구
    Picture(fileName: "chitterlings.jpeg", lat: 34.894858, lng: 127.410527, like: 9, image: nil),   // 순천
    Picture(fileName: "naver.jpeg", lat: 37.203339, lng: 128.983486, like: 10, image: nil),         // 태백

    Picture(fileName: "dangjin.jpeg", lat: 35.189311, lng: 128.779800, like: 11, image: nil),       // 부산
    Picture(fileName: "42.png", lat: 33.380777, lng: 126.285735, like: 12, image: nil),             // 제주도
    Picture(fileName: "home.png", lat: 35.155014, lng: 126.833236, like: 13, image: nil),           // 광주
    Picture(fileName: "chitterlings.jpeg", lat: 35.815905, lng: 127.0494026, like: 14, image: nil), // 전주
    Picture(fileName: "swift", lat: 37.710542, lng: 128.559588, like: 15, image: nil)          // 강릉
]

class MapViewController: UIViewController {
    // 네이버지도
    let naverMapView = NMFNaverMapView()
    // Firebase에서 사진을 받아오기 위해 필요한 레퍼런스
    let storageRef = Storage.storage().reference()
    // 네이버지도 위에 표시할 마커(사진)들
    var markers = [NMFMarker]()
    // 네이버지도 설정을 바꿀 때는 naverMapView 내부의 mapView 프로퍼티 사용
    var mapView: NMFMapView {
        return naverMapView.mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 네이버 지도를 표시
        showNaverMap()
        // 지도에 사진을 표시
        showPicturesOnMap()
    }

    // MapViewController에 네이버지도를 표시
    func showNaverMap() {
        self.view.addSubview(naverMapView)
        // 네이버지도 앱과 같이 뷰 전체에 지도가 표시되도록 설정
        // iOS 11.0 이후 버전에 대해 safeArea에 지도 표시하지 않을지 논의 필요 할지도?
        naverMapView.anchor(
            top: self.view.topAnchor,
            left: self.view.leftAnchor,
            bottom: self.view.bottomAnchor,
            right: self.view.rightAnchor
        )
        // 초기화면. 한국 전체가 보이도록 줌레벨, 카메라좌표값 변경
        naverMapView.mapView.moveCamera(NMFCameraUpdate(position: defaultPosition))
    }

    // Firebase로부터 사진정보를 읽어와서 네이버지도 위에 출력
    // Naver Map API에서 제공하는 Marker 기능을 사용하여 마커 대신 사진을 표시하는 방식으로 구현
    func showPicturesOnMap() {
        for var picture in pictures {
            // 지도상 출력할 위치(위도, 경도) 지정
            let tmpMarker = NMFMarker(position: NMGLatLng(lat: picture.lat, lng: picture.lng))

            // 마커를 일단 숨김처리한 후 지도에 표시할 수 있는 사진일 경우에만 표시함
            tmpMarker.hidden = true

            // 마커 사이즈 설정
            tmpMarker.height = 60
            tmpMarker.width = 60

            // Firebase 스토리지에서 사진 가져와서 마커 대신 지도에 표시
            // 다운 받을 수 있는 최대 용량은 1MB로 제한 (juhur todo 제한 용량은 논의 후에 변경)
            let islandRef = storageRef.child(picture.fileName)
            islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print(error)
                } else if let data = data, let image = UIImage(data: data) {
                    // 출력할 수 있는 이미지의 경우 지도에 표시
                    tmpMarker.hidden = false
                    picture.image = image
                    tmpMarker.iconImage = NMFOverlayImage(image: image)
                } else {
                    print("FAIL")
                }
            }

            // 사진이 겹칠시 좋아요 수가 큰 사진만 표시
            tmpMarker.zIndex = picture.like
            tmpMarker.isHideCollidedMarkers = true

            // juhur todo 마커(사진) 터치시에 상세정보 표시
            tmpMarker.touchHandler = { (_: NMFOverlay) -> Bool in
                print(picture.like, "touched!!!")

                let cameraUpdate = NMFCameraUpdate(
                    scrollTo: NMGLatLng(lat: picture.lat - 0.05, lng: picture.lng), zoomTo: 11)
                cameraUpdate.animation = .fly
                cameraUpdate.animationDuration = 1.3
                self.mapView.moveCamera(cameraUpdate)

                let pictureDetail = MapDetailViewController(picture: picture)
                self.present(pictureDetail, animated: true, completion: nil)
                return true
            }

            // 마커를 네이버 지도에 지정
            tmpMarker.mapView = mapView

            // 새 마커 객체 배열에 추가
            markers.append(tmpMarker)
        }

    }

}
