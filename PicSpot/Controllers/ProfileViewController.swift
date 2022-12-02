//
//  ProfileViewController.swift
//  PicSpot
//
//  Created by jun on 2022/10/06.
//

import UIKit

class ProfileViewController: UIViewController {
    let constants = Constants()
    // 임시 변수. 뷰 토글용. 후에 로그인 여부 판단 역할
    var logged = true
    // MARK: - Properties

    lazy var setting: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "gearshape"),
                                     style: .plain, target: self, action: #selector(handleSetting))
        button.tintColor = .black
        return button
    }()

    lazy var pictureView: MyPictureController = {
        let picture = MyPictureController(collectionViewLayout: UICollectionViewFlowLayout())
        picture.view.frame = CGRect(x: 0, y: 0, width: constants.screenWidth,
                                    height: constants.screenHeight)
        return picture
    }()

    lazy var logInView: LogInViewController = {
        let view = LogInViewController()
        return view
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
        if logged {
            view.addSubview(pictureView.view)
            navigationItem.rightBarButtonItem = setting
        } else {
            view.addSubview(logInView.view)
        }
    }

    @objc func handleSetting() {
        let rootVC = SettingViewController()
        rootVC.title = "설정"
        navigationController?.navigationBar.topItem?.backButtonTitle = "취소"
        navigationController?.pushViewController(rootVC, animated: true)
    }
}
