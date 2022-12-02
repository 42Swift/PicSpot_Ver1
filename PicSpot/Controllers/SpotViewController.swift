//
//  SpotViewController.swift
//  PicSpot
//
//  Created by jun on 2022/10/06.
//

import UIKit

class SpotViewController: UIViewController {
    lazy var uploadSpot: UIButton = {
        let button = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)
        let sfSymbol = UIImage(systemName: "plus.circle.fill", withConfiguration: largeConfig)
        button.setImage(sfSymbol, for: .normal)
        button.tintColor = .white
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(uploadSpot)
        uploadSpot.addTarget(self, action: #selector(moveUploadSpot), for: .touchUpInside)
        uploadSpot.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 110, paddingRight: 10)
    }
    @objc func moveUploadSpot() {
        let rootVC = UploadViewController()
        rootVC.title = "새 게시물"
        let naviVC = UINavigationController(rootViewController: rootVC)
        naviVC.modalPresentationStyle = .fullScreen
        self.present(naviVC, animated: true)
    }
}
