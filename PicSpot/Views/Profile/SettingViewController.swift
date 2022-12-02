//
//  LogInViewController.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/21.
//

import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {

    lazy var save: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "저장",
                                     style: .plain, target: self, action: #selector(handleSave))
        button.tintColor = .black
        return button
    }()

    lazy var guide: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "이름"
        label.textColor = .black
        return label
    }()

    lazy var textField: UITextField = {
        // Set x, y and width and height to place UITextField.
        let width: CGFloat = Constants().screenWidth - 50
        let height: CGFloat = 50
        let posX: CGFloat = (Constants().screenWidth - width)/2
        let posY: CGFloat = (Constants().screenHeight - height)/2

        // Create a UITextField.
        let textField = UITextField(frame: CGRect(x: posX, y: posY, width: width, height: height))

        // Substitute the characters to be displayed.
        textField.text = "Jaewpark"
        // Set Delegate to itself
        textField.delegate = self
        // Display frame.
        textField.borderStyle = .roundedRect
        // Add clear button.
        textField.clearButtonMode = .always
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = save
        view.backgroundColor = .white
        // Add textfield to view
        self.view.addSubview(self.textField)
        textField.placeholder = "이름을 입력하세요"
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.becomeFirstResponder()

        // Add guide to view
        self.view.addSubview(self.guide)
        guide.anchor(left: textField.leftAnchor, bottom: textField.topAnchor, paddingBottom: 5)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Called just before UITextField is edited
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("textFieldDidBeginEditing: \((textField.text) ?? "Empty")")
    }

    // Called immediately after UITextField is edited
    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("textFieldDidEndEditing: \((textField.text) ?? "Empty")")
    }

    // Called when should keyboard go down
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return textField.text != ""
    }

    // Called when the line feed button is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Process of closing the Keyboard when the line feed button is pressed.
        textField.endEditing(true)
        return true
    }

    @objc func handleSave() {
        // user.name = textField.text 같이 속성 바꿔줄 것.
        // user의 속성 자체를 바꾸기 때문에 부모뷰랑 변수 공유할 필요 없음
        self.navigationController?.popViewController(animated: true)
    }
}
