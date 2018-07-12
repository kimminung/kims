//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2018. 7. 5..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import MobileCoreServices

final class ViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  private let imagePickerController = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePickerController.delegate = self
  }
  
  @IBAction private func pickImage(_ sender: Any) {
    print("\n---------- [ pickImage ] ----------\n")
    
    let type = UIImagePickerControllerSourceType.photoLibrary
    guard UIImagePickerController.isSourceTypeAvailable(type) else { return }
    
    imagePickerController.sourceType = type
    present(imagePickerController, animated: true)
  }
  
  
  @IBAction private func takePicture(_ sender: Any) {
    print("\n---------- [ takePicture ] ----------\n")
    
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePickerController.sourceType = .camera
    imagePickerController.allowsEditing = true
    
    present(imagePickerController, animated: true)
  }
  
  @IBAction private func takePictureWithDelay(_ sender: Any) {
    print("\n---------- [ takePictureWithDelay ] ----------\n")
    
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePickerController.sourceType = .camera
    
    // public.image
    print(imagePickerController.mediaTypes)
    
    // [public.image, public.movie]
    print(UIImagePickerController.availableMediaTypes(for: .camera) ?? [])
//    imagePickerController.mediaTypes = ["public.image", "public.movie"]
    imagePickerController.mediaTypes = [kUTTypeImage as String, kUTTypeMovie as String]
    
    present(imagePickerController, animated: true) { [weak self] in
      DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
        self?.imagePickerController.takePicture()
      })
    }
  }
  
  @IBAction private func recordingVideo(_ sender: Any) {
    print("\n---------- [ recordingVideo ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePickerController.sourceType = .camera
    imagePickerController.mediaTypes = [kUTTypeMovie as String]
    imagePickerController.cameraCaptureMode = .video
    
    imagePickerController.cameraDevice = .front
    imagePickerController.cameraFlashMode = .auto
    
    present(imagePickerController, animated: true)
  }
  
  @IBAction private func toggleAllowsEditing(_ sender: Any) {
    print("\n---------- [ toggleAllowsEditing ] ----------\n")
    imagePickerController.allowsEditing = !imagePickerController.allowsEditing
  }
}


// MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
      imageView.image = selectedImage
      
      if let saveImage = selectedImage {
        UIImageWriteToSavedPhotosAlbum(saveImage, nil, nil, nil)
      }
    }
    
    picker.dismiss(animated: true)
  }
  
  /***************************************************
   // 앨범에 이미지 저장
   UIImageWriteToSavedPhotosAlbum(<#T##image: UIImage##UIImage#>, <#T##completionTarget: Any?##Any?#>, <#T##completionSelector: Selector?##Selector?#>, <#T##contextInfo: UnsafeMutableRawPointer?##UnsafeMutableRawPointer?#>)
   
   // 앨범에 비디오 저장
   UISaveVideoAtPathToSavedPhotosAlbum(<#T##videoPath: String##String#>, <#T##completionTarget: Any?##Any?#>, <#T##completionSelector: Selector?##Selector?#>, <#T##contextInfo: UnsafeMutableRawPointer?##UnsafeMutableRawPointer?#>)
   ***************************************************/
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    print("\n---------- [ imagePickerControllerDidCancel ] ----------\n")
    picker.dismiss(animated: true)
  }
}


