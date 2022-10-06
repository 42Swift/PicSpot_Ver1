//
//  MapViewController.swift
//  PicSpot
//
//  Created by jun on 2022/10/06.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = NMFNaverMapView(frame: view.frame)
        view.addSubview(mapView)
    }

}
