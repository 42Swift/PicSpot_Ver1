//
//  ProfileViewController.swift
//  PicSpot
//
//  Created by jun on 2022/10/06.
//

import UIKit

class ProfileViewController: UIViewController {
    let constants = Constants()

    // MARK: Properties

    lazy var alert: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                     style: .plain, target: self, action: #selector(handleAlert))
        return button
    }()

    lazy var informationView: InformationView = {
        let information = InformationView()
        information.view.frame = CGRect(x: 0, y: 0,
                                        width: constants.screenWidth, height: constants.informationHeight)
        return information
    }()

    lazy var pictureView: MyPictureView = {
        let picture = MyPictureView()
        picture.view.frame = CGRect(x: 0, y: constants.informationHeight, width: constants.screenWidth,
                                    height: constants.screenHeight -  constants.informationHeight)
        return picture
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainGray

        view.addSubview(informationView.view)
        view.addSubview(pictureView.view)

        navigationItem.rightBarButtonItem = alert
    }

    @objc func handleAlert() {
        print("alert is clicked")
    }
}
