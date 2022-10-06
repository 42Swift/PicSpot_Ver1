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
        view.backgroundColor = .systemBackground

        let vc1 = UINavigationController(rootViewController: SpotViewController())
        let vc2 = UINavigationController(rootViewController: MapViewController())
        let vc3 = UINavigationController(rootViewController: ClubViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())

        vc1.tabBarItem.image = UIImage(systemName: "camera.on.rectangle.fill")
        vc2.tabBarItem.image = UIImage(systemName: "map")
        vc3.tabBarItem.image = UIImage(systemName: "person.2.fill")
        vc4.tabBarItem.image = UIImage(systemName: "person.crop.circle")

        tabBar.tintColor = .label

        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }

}
