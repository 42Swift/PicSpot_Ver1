//
//  PictureView.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/14.
//

import UIKit

class PictureView: UIView {

    private var myPic = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout() )
    private var favoritePic = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout() )

    override init(frame: CGRect) {
        super.init(frame: frame)
        setPicture()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setPicture()
    }

    func setMyPic() {
        myPic.translatesAutoresizingMaskIntoConstraints = false
        myPic.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myPic.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        myPic.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        myPic.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

    }

    func setFavoritePic() {

    }

    func setPicture() {
        self.backgroundColor = .white

        self.addSubview(myPic)
        self.addSubview(favoritePic)

        setMyPic()
        setFavoritePic()


    }

}
