//
//  MainTabBarViewController.swift
//  PicSpot
//
//  Created by jun on 2022/10/05.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 뷰컨트롤러 연결
        let vc1 = UINavigationController(rootViewController: SpotViewController())
        let vc2 = UINavigationController(rootViewController: MapViewController())
        let vc3 = UINavigationController(rootViewController: ClubViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())

        // 탭바 아이콘 sf symbols로 설정
        vc1.tabBarItem.image = UIImage(systemName: "camera.on.rectangle.fill")
        vc2.tabBarItem.image = UIImage(systemName: "map")
        vc3.tabBarItem.image = UIImage(systemName: "person.2.fill")
        vc4.tabBarItem.image = UIImage(systemName: "person.crop.circle")

        // 탭바 아이템 타이틀 설정
        vc1.title = "Spot"
        vc2.title = "Map"
        vc3.title = "Club"
        vc4.title = "Profile"

        // 탭바 아이템 선택시의 색상
        tabBar.tintColor = .label
        // 탭바 배경 색상
        tabBar.backgroundColor = .systemBackground

        // 탭바 아이템 표시
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        self.selectedIndex = 3

    }

}
