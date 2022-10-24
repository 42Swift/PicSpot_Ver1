//
//  AddPictureButton.swift
//  PicSpot
//
//  Created by 박재우 on 2022/10/24.
//

//import UIKit
//import Photos
//
//var addSymbolButton: UIButton = {
//    var button = UIButton(type: .system)
//    let deviceSize = UIScreen.main.bounds.size
//    let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)
//    let sfSymbol = UIImage(systemName: "plus.circle.fill", withConfiguration: largeConfig)
//    button.setImage(sfSymbol, for: .normal)
//    button.tintColor = .systemPink
//    button.frame = CGRect(x: deviceSize.width - 60, y: deviceSize.height - 160, width: 50, height: 50)
//    button.addTarget(self, action: #selector(pickerButton), for: .touchUpInside)
//    return button
//}()
//
//@objc func pickerButton(sender: UIButton!) {
//    var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
//    // 유저가 선택할 수 있는 에셋의 최대 갯수
//    configuration.selectionLimit = 1
//    // picker 가 표시하는 에셋 타입 제한, .images, .livePhotos, .videos 혹은 아래 방법은 all
//    // configuration.filter = .any(of: [.images, .livePhotos, .videos])
//    configuration.filter = .images
//
//    let picker = PHPickerViewController(configuration: configuration)
//    picker.delegate = self
//    self.present(picker, animated: true, completion: nil)
//}
