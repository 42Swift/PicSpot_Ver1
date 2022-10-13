//
//  InformationView.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/13.
//

import UIKit

class InformationView: UIView {
    // 자주 쓰는 상수 저장. 이 방법말고 있을 거 같은디
    struct Constants {
        let picSize: CGFloat = 50
        let nameSize: CGFloat = 20
        let markSize: CGFloat = 10
        // btw 말고 AToB 가 나은가
        let btwTopPic: CGFloat = 100
        let btwLeftPic: CGFloat = 80
        let btwPicName: CGFloat = 10
        let btwNameMark: CGFloat = 10
        let btwAlertRight: CGFloat = 30
        let btwTopAlert: CGFloat = 50
    }

    private var profilePic = UIImageView()
    private var name = UILabel()
    private var snsMark = UIButton()
    private var alert = UIButton()
    private var constant = Constants()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setInformation()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setInformation()
    }

    func setProfilePic() {
        let ratio: Double
        // 원으로 만들기
//        profilePic.layer.borderWidth = 1
//        profilePic.layer.masksToBounds = false
//        profilePic.layer.borderColor = UIColor.black.cgColor
//        profilePic.layer.cornerRadius = profilePic.layer.bounds.width / 2
//        profilePic.clipsToBounds = false
//        profilePic.contentMode = .scaleAspectFill

        profilePic.translatesAutoresizingMaskIntoConstraints = false
        profilePic.image = UIImage(systemName: "camera.fill")
        profilePic.tintColor = .blue
        profilePic.backgroundColor = .gray
        ratio = profilePic.image!.size.width / profilePic.image!.size.height

        // constraint
        // 변수로 설정하고 한번에 true 해주는 게 더 깔끔하려나? false로 바꿀 일은 없어서 그게 나을지 잘 모르겠음...
        profilePic.heightAnchor.constraint(equalToConstant: constant.picSize).isActive = true
        profilePic.widthAnchor.constraint(equalToConstant: constant.picSize * ratio).isActive = true
        profilePic.topAnchor.constraint(equalTo: self.topAnchor,
                                        constant: constant.btwTopPic).isActive = true
        profilePic.leftAnchor.constraint(equalTo: self.leftAnchor,
                                         constant: constant.btwLeftPic).isActive = true
    }

    func setName() {
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "test name"
        name.font = UIFont.systemFont(ofSize: constant.nameSize)
        name.textColor = .black
        name.sizeToFit()

        // constraint
        name.centerYAnchor.constraint(equalTo: profilePic.centerYAnchor).isActive = true
        name.leftAnchor.constraint(equalTo: profilePic.rightAnchor, constant: constant.btwPicName).isActive = true
    }

    func setSnsMark() {
        snsMark.translatesAutoresizingMaskIntoConstraints = false
        snsMark.setImage(UIImage(systemName: "camera"), for: .normal)

        // constraint
        snsMark.centerYAnchor.constraint(equalTo: name.centerYAnchor).isActive = true
        snsMark.leftAnchor.constraint(equalTo: name.rightAnchor, constant: constant.btwNameMark).isActive = true
    }

    func setAlert() {
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.setImage(UIImage(systemName: "bell"), for: .normal)
        // constraint
        alert.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -constant.btwAlertRight).isActive = true
        alert.topAnchor.constraint(equalTo: self.topAnchor, constant: constant.btwTopAlert).isActive = true
    }

    func setInformation() {
        self.backgroundColor = .systemGray6

        self.addSubview(profilePic)
        self.addSubview(name)
        self.addSubview(snsMark)
        self.addSubview(alert)

        setProfilePic()
        setName()
        setSnsMark()
        setAlert()
    }
}
