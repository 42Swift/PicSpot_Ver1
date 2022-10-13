//
//  ProfileViewController.swift
//  PicSpot
//
//  Created by jun on 2022/10/06.
//

import UIKit

class ProfileViewController: UIViewController {
    let informationView = InformationView(frame: CGRect(x: 0, y: 0,
                                                         width: UIScreen.main.bounds.size.width, height: 200))
    let pictureView = PictureView(frame: CGRect(x: 0, y: 200,
                                                width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 200))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(informationView)
        view.addSubview(pictureView)
        view.backgroundColor = .lightGray
    }

}
