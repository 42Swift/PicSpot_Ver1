//
//  MyPictureView.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/16.
//

import UIKit

private let cellID = "Cell"
private let headerID = "Header"

class MyPictureViewController: UICollectionViewController {

    // MARK: Properties
    let constants: Constants = Constants()
    var images = [UIImage]()
    let myImages: [UIImage] = [#imageLiteral(resourceName: "camera-1024"), #imageLiteral(resourceName: "spider-man"), #imageLiteral(resourceName: "batman"), #imageLiteral(resourceName: "suicide-squad"), #imageLiteral(resourceName: "camera-1024"), #imageLiteral(resourceName: "spider-man"), #imageLiteral(resourceName: "batman"), #imageLiteral(resourceName: "suicide-squad"), #imageLiteral(resourceName: "camera-1024"), #imageLiteral(resourceName: "spider-man"), #imageLiteral(resourceName: "batman"), #imageLiteral(resourceName: "suicide-squad"), #imageLiteral(resourceName: "camera-1024"), #imageLiteral(resourceName: "spider-man"), #imageLiteral(resourceName: "batman"), #imageLiteral(resourceName: "suicide-squad"), #imageLiteral(resourceName: "camera-1024"), #imageLiteral(resourceName: "spider-man"), #imageLiteral(resourceName: "batman"), #imageLiteral(resourceName: "suicide-squad"), #imageLiteral(resourceName: "camera-1024"), #imageLiteral(resourceName: "spider-man"), #imageLiteral(resourceName: "batman"), #imageLiteral(resourceName: "suicide-squad") ]
    var informationView: InformationView?
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        self.images = myImages

        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.backgroundColor = .white
        // register header
        collectionView!.register(InformationView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: headerID)
        collectionView.contentInsetAdjustmentBehavior = .never

        // register cell
        collectionView.register(PictureViewCell.self, forCellWithReuseIdentifier: cellID)

    }

    override func viewWillAppear(_ animated: Bool) {
        informationView?.name.text = appDelegate?.testUser.name
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: UICollectionViewDelegate/DataSource
extension MyPictureViewController {
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        self.informationView = collectionView
            .dequeueReusableSupplementaryView(ofKind: kind,
                                              withReuseIdentifier: headerID,
                                              for: indexPath) as? InformationView
        return self.informationView!
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: cellID,
                                 for: indexPath) as? PictureViewCell
        cell!.image = images[indexPath.row]
        return cell!
    }

}

// MARK: UICollectionViewDelegateFlowLayout

extension MyPictureViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: constants.informationHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
}
