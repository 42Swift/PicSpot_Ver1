//
//  StorageImageHandler.swift
//  PicSpot
//
//  Created by 박재우 on 2022/10/24.
//

import UIKit
import FirebaseStorage

class StorageImageController: UIViewController {
    let storage = Storage.storage()
    // 파일 업로드, 다운로드, 삭제, 메타데이터 가져오기 또는 업데이트를 하려면 참조를 만듭니다
    // 참조는 클라우드의 파일을 가리키는 포인터로 생각하면 됩니다
    func uploadImage(imageData: ImageWithName) {
        guard imageData.image != nil else { print("No Image");return }
        let storageRef = storage.reference()
        // Set Image File's Unique name
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let uploadDate = formatter.string(from: Date())
        // Child references can also take paths delimited by '/'
        let imagesRef = imageData.profile ?
        storageRef.child("\(imageData.userName)/profile") : storageRef.child("\(imageData.userName)/\(uploadDate)")
        // 이미지 압축 및 추가
        let data = imageData.image!.jpegData(compressionQuality: 0.5)!
        // 파일 메타데이터 추가 (이미지 확장자 jpg로 고정)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        // putData(:metadata:completion:)은 NSData 객체를 취하고 FIRStorageUploadTask를 반환하며,
        // 이를 사용하여 업로드를 관리하고 업로드 상태를 모니터링할 수 있습니다.
        imagesRef.putData(data, metadata: metadata) { (metadata, error) in
            guard metadata != nil else {
                print(error?.localizedDescription ?? "이미지 업로드에 실패하였습니다")
                return
            }
        }
        /* 업로드 상태를 모니터링 하는 법
         // Start uploading a file
         let uploadTask = storageRef.putFile(from: localFile)

         // Pause the upload
         uploadTask.pause()

         // Resume the upload
         uploadTask.resume()

         // Cancel the upload
         uploadTask.cancel()
         */
    }
    func downloadImage(_ imageView: UIImageView, _ imageData: ImageWithName) {
        guard imageData.imageName != nil else { print("No Image name");return }
        /* 다운로드 방법 3가지
         1. 메모리에서 NSData로 다운로드
         2. 기기의 파일을 나타내는 NSURL로 다운로드
         3. 온라인 파일을 나타내는 NSURL 생성
         
         // 1. Create a reference with an initial file path and name
         let pathReference = storage.reference(withPath: "images/stars.jpg")

         // 2. Create a reference from a Google Cloud Storage URI
         let gsReference = storage.reference(forURL: "gs://<your-firebase-storage-bucket>/images/stars.jpg")

         // 3. Create a reference from an HTTPS URL
         // Note that in the URL, characters are URL escaped!
         let imageURL = "https://firebasestorage.googleapis.com/b/bucket/o/images%20stars.jpg"
         let httpsReference = storage.reference(forURL: imageURL)
        */
        let imagePath = imageData.profile ?
        "\(imageData.userName)/profile" : "\(imageData.userName)/\(imageData.imageName!)"
        let pathReference = storage.reference(withPath: imagePath)
        pathReference.downloadURL { url, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let data = NSData(contentsOf: url!)
                let image = UIImage(data: data! as Data)
                imageView.image = image
            }
        }
    }
}
