//
//  InformationView.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/13.
//

import UIKit

class InformationView: UIViewController {

    // MARK: - Properties

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainGray

        view.addSubview(profilePicture)
        profilePicture.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        profilePicture.anchor(left: view.leftAnchor, paddingLeft: constant.btwLeftPic,
                              width: constant.picSize, height: constant.picSize)
        profilePicture.layer.cornerRadius = constant.picSize / 2

        view.addSubview(name)
        name.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor).isActive = true
        name.anchor(left: profilePicture.rightAnchor, paddingLeft: constant.btwPicName)
        name.font = UIFont.systemFont(ofSize: constant.nameSize)

        view.addSubview(snsMark)
        snsMark.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor).isActive = true
        snsMark.anchor(left: name.rightAnchor, paddingLeft: constant.btwNameMark,
                       width: constant.markSize, height: constant.markSize)

        return view
    }()

    lazy var profilePicture: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "camera-1024")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()

    lazy var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "test name"
        label.textColor = .black
        return label
    }()

    lazy var snsMark: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "camera")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(linkToSNS), for: .touchUpInside)
        return button
    }()

    private var constant = Constants()

    // MARK: LifeCycle

    init() {
        super.init(nibName: nil, bundle: nil)

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = .mainGray
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor,
                             right: view.rightAnchor, height: view.frame.height)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Selectors

    @objc func linkToSNS() {
        print("snsMark is clicked")
    }

}

