//
//  InformationView.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/13.
//

import UIKit

class InformationView: UICollectionReusableView {
    // MARK: - Properties

    lazy var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Jaewpark"
        label.textColor = .black
        return label
    }()

    private var constants = Constants()

    // MARK: LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainGray

        addSubview(name)
        name.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        name.anchor(top: topAnchor, paddingTop: constants.informationHeight / 2 + 10)
        name.font = UIFont.systemFont(ofSize: constants.nameSize)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
