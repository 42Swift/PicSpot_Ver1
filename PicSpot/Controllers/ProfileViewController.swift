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

    lazy var pictureView: MyPictureController = {
        let picture = MyPictureController(collectionViewLayout: UICollectionViewFlowLayout())
        picture.view.frame = CGRect(x: 0, y: 0, width: constants.screenWidth,
                                    height: constants.screenHeight)
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

        view.addSubview(pictureView.view)

        navigationItem.rightBarButtonItem = alert
    }

    @objc func handleAlert() {
        print("alert is clicked")
    }
}
