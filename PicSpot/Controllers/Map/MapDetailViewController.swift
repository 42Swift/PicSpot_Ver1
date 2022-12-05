//
//  MapDetailViewController.swift
//  PicSpot
//
//  Created by jun on 2022/10/23.
//

import UIKit

class MapDetailViewController: UIViewController {
    var picture: Picture
    var mapDetailView: MapDetailView!

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

        mapDetailView = MapDetailView(frame: self.view.frame)
        self.view = mapDetailView

        mapDetailView.imageView.image = picture.image
        mapDetailView.dateLabel.text = "2022.12.02 14:58"
        mapDetailView.userIDLabel.text = "jaewpark"
    }
}
