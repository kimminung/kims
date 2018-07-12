//
//  RotatingObject.swift
//  개인플레이
//
//  Created by 김민웅 on 2018. 7. 9..
//  Copyright © 2018년 김민웅. All rights reserved.
//


import Foundation
import UIKit
import MobileCoreServices


class RotatingController: UIViewController {
    

    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet private weak var ImageView: UIImageView!
    private let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerController.delegate = self
    }
    @IBAction private func takePicture(_ sender: Any) {
        print("\n---------- [ takePicture ] ----------\n")

        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePickerController.sourceType = .camera
        imagePickerController.allowsEditing = true

        present(imagePickerController, animated: true)
    }
    @IBAction func Rotate(_ sender: Any) {
        Label.transform = Label.transform.rotated(by: 30)
        Button.transform = Button.transform.rotated(by: 60)
        ImageView.transform = ImageView.transform.rotated(by: 100)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //        tabBarController?
    }
    
}

extension RotatingController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("\n---------- [ didFinishPickingMediaWithInfo ] ----------\n")

        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeMovie) {
            let url = info[UIImagePickerControllerMediaURL] as! NSURL
            if let path = url.path {
                UISaveVideoAtPathToSavedPhotosAlbum(path, nil, nil, nil)
            }
        } else {
            let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
            let selectedImage = editedImage ?? originalImage
            ImageView.image = selectedImage

            if let saveImage = selectedImage {
                UIImageWriteToSavedPhotosAlbum(saveImage, nil, nil, nil)
            }
        }

        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("\n---------- [ imagePickerControllerDidCancel ] ----------\n")
        picker.dismiss(animated: true)
    }
}
