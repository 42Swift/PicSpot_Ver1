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

        // 제스처인식기 생성 및 연결
        let tapImageViewRecognizer
        = UITapGestureRecognizer(target: self, action: #selector(profileTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapImageViewRecognizer)

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

    lazy var myImagesButton: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.setTitle("내 사진", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(myToFavorite), for: .touchUpInside)
        return button
    }()

    lazy var favoriteImagesButton: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.setTitle("즐겨찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(favoriteToMy), for: .touchUpInside)
        return button
    }()

    private var constants = Constants()

    // MARK: LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainGray

        addSubview(profilePicture)
        profilePicture.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profilePicture.anchor(left: leftAnchor, paddingLeft: constants.btwLeftPic,
                              width: constants.picSize, height: constants.picSize)
        profilePicture.layer.cornerRadius = constants.picSize / 2

        addSubview(name)
        name.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor).isActive = true
        name.anchor(left: profilePicture.rightAnchor, paddingLeft: constants.btwPicName)
        name.font = UIFont.systemFont(ofSize: constants.nameSize)

        addSubview(snsMark)
        snsMark.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor).isActive = true
        snsMark.anchor(left: name.rightAnchor, paddingLeft: constants.btwNameMark,
                       width: constants.markSize, height: constants.markSize)

        addSubview(myImagesButton)
        myImagesButton.anchor(top: topAnchor, left: leftAnchor,
                              paddingTop: constants.informationHeight - 40,
                              width: constants.screenWidth / 2, height: 40)

        addSubview(favoriteImagesButton)
        favoriteImagesButton.anchor(top: topAnchor, left: leftAnchor,
                                    paddingTop: constants.informationHeight - 40,
                                    paddingLeft: constants.screenWidth / 2,
                                    width: constants.screenWidth / 2, height: 40)

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Selectors

    @objc func linkToSNS() {
        print("snsMark is clicked")
    }

    @objc func profileTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        print("do something.")
    }

    @objc func myToFavorite() {
//        if whichImage == false {
            favoriteImagesButton.backgroundColor = .systemGray2
            myImagesButton.backgroundColor = .systemGray4
//            whichImage = true
//        }
    }

    @objc func favoriteToMy() {
//        if whichImage == true {
            myImagesButton.backgroundColor = .systemGray2
            favoriteImagesButton.backgroundColor = .systemGray4
//            whichImage = false
//        }
    }
}
