//
//  LogInViewController.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/21.
//

import UIKit

class LogInViewController: UIViewController {
    let constants = Constants()

    let notice: UILabel = {
        let label = UILabel()
        label.text = "로그인을 해주세요"
        return label
    }()

    let forApple: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.setTitle("Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    let forGoogle: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.setTitle("Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    let forNaver: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.setTitle("Naver", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    let forKakao: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.setTitle("Kakao", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(notice)
        view.frame = CGRect(x: 0, y: 0, width: constants.screenWidth, height: constants.screenHeight)

        notice.anchor(top: view.topAnchor, paddingTop: 200)
        notice.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(forApple)
        forApple.anchor(top: view.topAnchor, left: view.leftAnchor,
                        paddingTop: 300, paddingLeft: 30, width: 50, height: 20)
        forApple.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(forGoogle)
        forGoogle.anchor(top: forApple.topAnchor, left: view.leftAnchor,
                         paddingTop: 30, paddingLeft: 30, width: 50, height: 20)
        forGoogle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(forNaver)
        forNaver.anchor(top: forGoogle.topAnchor, left: view.leftAnchor,
                        paddingTop: 30, paddingLeft: 30, width: 50, height: 20)
        forNaver.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(forKakao)
        forKakao.anchor(top: forNaver.topAnchor, left: view.leftAnchor,
                        paddingTop: 30, paddingLeft: 30, width: 50, height: 20)
        forKakao.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
}
