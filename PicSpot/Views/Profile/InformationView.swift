//
//  InformationView.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/13.
//

import UIKit

class InformationView: UICollectionReusableView {

    // MARK: - Properties

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
        button.setImage(UIImage(named: "camera-1024")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(linkToSNS), for: .touchUpInside)
        return button
    }()

    private var constant = Constants()

    // MARK: LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainGray

        addSubview(profilePicture)
        profilePicture.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profilePicture.anchor(left: leftAnchor, paddingLeft: constant.btwLeftPic,
                              width: constant.picSize, height: constant.picSize)
        profilePicture.layer.cornerRadius = constant.picSize / 2

        addSubview(name)
        name.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor).isActive = true
        name.anchor(left: profilePicture.rightAnchor, paddingLeft: constant.btwPicName)
        name.font = UIFont.systemFont(ofSize: constant.nameSize)

        addSubview(snsMark)
        snsMark.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor).isActive = true
        snsMark.anchor(left: name.rightAnchor, paddingLeft: constant.btwNameMark,
                       width: constant.markSize, height: constant.markSize)

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Selectors

    @objc func linkToSNS() {
        print("snsMark is clicked")
    }

}
