//
//  MapDetailView.swift
//  PicSpot
//
//  Created by jun on 2022/12/05.
//

import UIKit

class MapDetailView: UIView {
    private let labelFontSize: CGFloat = 20.0
    private let labelMarginX: CGFloat = 10.0
    private let labelMarginY: CGFloat = 5.0

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.sizeToFit()
        return dateLabel
    }()

    let userIDLabel: UILabel = {
        let userIDLabel = UILabel()
        userIDLabel.translatesAutoresizingMaskIntoConstraints = false
        userIDLabel.sizeToFit()
        return userIDLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.backgroundColor = .mainGray
        setupDetailView()
    }

    private func setupDetailView() {
        // View 중앙에 사진
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])

        // 사진 좌측 상단에 날짜 표시
        self.addSubview(dateLabel)
        dateLabel.font = .systemFont(ofSize: labelFontSize)
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -labelMarginY),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: labelMarginX)
        ])

        // 사진 우측 상단에 ID 표시
        self.addSubview(userIDLabel)
        userIDLabel.font = .systemFont(ofSize: labelFontSize)
        NSLayoutConstraint.activate([
            userIDLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -labelMarginY),
            userIDLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -labelMarginX)
        ])
    }
}
