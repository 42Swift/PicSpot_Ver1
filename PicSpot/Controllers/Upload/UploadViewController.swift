//
//  UploadViewController.swift
//  PicSpot
//
//  Created by 박재우 on 2022/12/02.
//

import UIKit
import PhotosUI
import NMapsMap

class UploadViewController: UIViewController {
    private let deviceWidth = Constants().screenWidth
    lazy var imageSelect: Bool = false
    lazy var leftItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                     style: .done, target: self, action: #selector(back))
        button.tintColor = .black
        return button
    }()
    lazy var rightItem = UIBarButtonItem(title: "공유", style: .done, target: self, action: #selector(pickerButton))
    lazy var calendar: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "calendar"))
        imageView.tintColor = .systemRed
        return imageView
    }()
    lazy var creationDate: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = label.font.withSize(25)
        return label
    }()
    lazy var imageButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "plus", withConfiguration: largeConfig), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .gray
        return button
    }()
    lazy var map: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "map"))
        imageView.tintColor = .systemRed
        return imageView
    }()
    private let naverMap = NMFNaverMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
        view.addSubview(calendar)
        calendar.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                        left: view.leftAnchor, paddingTop: 60,
                        paddingLeft: 20, width: 40, height: 40)
        view.addSubview(creationDate)
        creationDate.anchor(top: calendar.bottomAnchor,
                            left: view.leftAnchor, paddingTop: 5,
                            paddingLeft: 30, width: 150, height: 70)
        view.addSubview(imageButton)
        imageButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                           right: view.rightAnchor, paddingTop: 60,
                           paddingRight: 20, width: 120, height: 120)
        imageButton.addTarget(self, action: #selector(phpicker), for: .touchUpInside)
        view.addSubview(map)
        map.anchor(top: imageButton.bottomAnchor, left: view.leftAnchor,
                   paddingTop: 40, paddingLeft: 20, width: 40, height: 40)
    }
    func generateMap() {
        self.view.addSubview(naverMap)
        naverMap.anchor(top: map.bottomAnchor, left: view.leftAnchor,
                       right: view.rightAnchor, paddingTop: 25, paddingLeft: 25,
                       paddingRight: 25, width: deviceWidth, height: deviceWidth)
    }
    @objc func phpicker() {
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.selectionLimit = 1
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func pickerButton() {
        guard imageSelect else { return }
        StorageImageHandler().uploadImage(imageData:
            ImageWithName(userName: "haha", profile: false, image: self.imageButton.currentImage, imageName: nil))
        self.dismiss(animated: true, completion: nil)
    }
}

extension UploadViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        guard false == results.isEmpty else { return }
        if let assetId = results[0].assetIdentifier {
            if let assetResults = PHAsset.fetchAssets(withLocalIdentifiers: [assetId], options: nil).firstObject {
                guard let creationDate = assetResults.creationDate,
                      let coordinate = assetResults.location?.coordinate else {
                    let message = "사진의 정보가 누락되어서 거절되었습니다\n찍은 장소가 없습니다"
                    let alert = UIAlertController(title: "실패", message: message,
                                                  preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(okAction)
                    present(alert, animated: false, completion: nil)
                    return
                }
                let formatter = DateFormatter()
                formatter.dateFormat = "MM. dd.  yyyy\nH : mm"
                if results[0].itemProvider.canLoadObject(ofClass: UIImage.self) {
                    results[0].itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                        if let error = error {
                            print(error)
                            return
                        } else {
                            DispatchQueue.main.async {
                                let imagePosition = NMGLatLng(lat: coordinate.latitude, lng: coordinate.longitude)
                                let updatePosition = NMFCameraPosition(imagePosition, zoom: 16)
                                let marker = NMFMarker(position: imagePosition)
                                marker.mapView = self.naverMap.mapView
                                self.naverMap.mapView.moveCamera(NMFCameraUpdate(position: updatePosition))
                                self.imageSelect = true
                                self.creationDate.text = formatter.string(from: creationDate)
                                self.imageButton.setImage(image as? UIImage, for: .normal)
                                self.generateMap()
                            }
                        }
                    }
                }
            }
        }
    }
}
