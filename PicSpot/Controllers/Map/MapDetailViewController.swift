//
//  MapDetailViewController.swift
//  PicSpot
//
//  Created by jun on 2022/10/23.
//

import UIKit

class MapDetailViewController: UIViewController {
    private let margin: CGFloat = 20.0
    var picture: Picture
    private let textLogoColor: UIColor = .black

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
        dateLabel.font = .systemFont(ofSize: 20)
        return dateLabel
    }()

    let userIDLabel: UILabel = {
        let userIDLabel = UILabel()
        userIDLabel.translatesAutoresizingMaskIntoConstraints = false
        userIDLabel.font = .systemFont(ofSize: 20)
        return userIDLabel
    }()

    init(picture: Picture) {
        self.picture = picture
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium(), .large()]
        }
        view.backgroundColor = .mainGray

        view.addSubview(imageView)
        imageView.image = picture.image
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])

        view.addSubview(dateLabel)
        dateLabel.text = "2022.12.02 14:58"
        dateLabel.sizeToFit()
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -5),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])

        view.addSubview(userIDLabel)
        userIDLabel.text = "jaewpark"
        userIDLabel.sizeToFit()
        NSLayoutConstraint.activate([
            userIDLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -5),
            userIDLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
