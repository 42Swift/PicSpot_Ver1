//
//  MyPictureView.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/16.
//

import UIKit

private let cellID = "Cell"

class MyPictureView: UIViewController {
    let constants = Constants()
    var myPictureView = {
            let flowlayout = UICollectionViewFlowLayout()
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
            return collectionView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        myPictureView.dataSource = self
        myPictureView.delegate = self
        myPictureView.backgroundColor = .yellow
        view.addSubview(myPictureView)
        myPictureView.translatesAutoresizingMaskIntoConstraints = false

        // constraints
        myPictureView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myPictureView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myPictureView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myPictureView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        myPictureView.register(PictureViewCell.self, forCellWithReuseIdentifier: cellID)

    }
}

extension UIViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 4
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension UIViewController: UICollectionViewDelegate {

}

extension UIViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: view.frame.width / 3)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
}
