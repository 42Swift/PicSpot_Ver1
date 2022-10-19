//
//  Constants.swift
//  PicSpot
//
//  Created by 김나연 on 2022/10/16.
//

import Foundation
import UIKit

class Constants {
    // UIScreen
    let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    let screenHeight: CGFloat = UIScreen.main.bounds.size.height

    // InformationView
    let informationHeight: CGFloat = UIScreen.main.bounds.size.height / 3
    let picSize: CGFloat = 80
    let nameSize: CGFloat = 20
    let markSize: CGFloat = 20
    // btw 말고 AToB 가 나은가
    let btwTopPic: CGFloat = 10
    let btwLeftPic: CGFloat = 80
    let btwPicName: CGFloat = 10
    let btwNameMark: CGFloat = 10
}
