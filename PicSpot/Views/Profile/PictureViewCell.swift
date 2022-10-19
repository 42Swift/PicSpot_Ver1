//
//  PictureViewCell.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/16.
//

import UIKit

class PictureViewCell: UICollectionViewCell {

    var image: UIImage? {
        didSet {
            guard let image = image else { return }
            cellImageView.image = image
        }
    }

    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "suicide-squad")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(cellImageView)
        cellImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
