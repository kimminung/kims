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
        //    print(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        //동작이 가능하면 실행시키고, 불가하면 그냥 종료(guard)
        let type = UIImagePickerControllerSourceType.photoLibrary
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        imagePickerController.sourceType = type
        
        present(imagePickerController, animated: true)
    }
    
    
    @IBAction private func takePicture(_ sender: Any) {
        print("\n---------- [ takePicture ] ----------\n")
        //카메라 기능 추가(허용 누른 채 설정에 가서 이 어플의 설정 안에서 카메라 비허용 하고 다시 키면 검은화면)
        //설정 할때마다 재시작함.
        
        UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePickerController.sourceType = .camera
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
        print("11")
        /*
         This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSCameraUsageDescription key with a string value explaining to the user how the app uses this data.
         
         카메라 : NSCameraUsageDescription
         //plist에서 휴먼모드로 띄우고
         //Privacy - Camera Usage Description 추가, 벨류에 설명
         */
    }
    
    @IBAction private func takePictureWithDelay(_ sender:Any) {
        print("\n---------- [ takePictureWithDelay ] ----------\n")
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }
        imagePickerController.sourceType = .camera
        
        //["public.image"]
        print(imagePickerController.mediaTypes)
        //["public.image", "public.movie"]
        print(UIImagePickerController.availableMediaTypes(for: .camera) ?? [])
        
        //        imagePickerController.mediaTypes = ["public.image"]
        //imagePickerController.mediaTypes = ["public.image", "public.movie"]
        //여기까지 해보고 import MobileCoreServices 추가
        
        imagePickerController.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
        //      imagePickerController.mediaTypes = [kUTTypeImage as String, kUTTypeMovie as String]
        /*
         Cannot assign value of type '[CFString]' to type '[String]' Insert ' as [String]'
         */
        //        kUTTypeImage = kUTTypeGIF, BMP .. 등등 합쳐진거 말함
        /*
         kUTTypeMovie    //video o , audio o
         kUTTypeVideo    //video o , audio x
         */
        
        
        //        present(imagePickerController, animated: true)
        //                imagePickerController.takePicture()
        
        //        present(imagePickerController, animated: true) {
        //            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
        //                self.imagePickerController.takePicture()  //self가 있는걸로 봐서 present안에
        //escaping이 있는것 같으므로 윅셀프 처리
        //            })
        //        }
        present(imagePickerController, animated: true) { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                self?.imagePickerController.takePicture()
            })
        }
    }
    
    
    @IBAction private func recordingVideo(_ sender: Any) {
        print("\n---------- [ recordingVideo ] ----------\n")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
        imagePickerController.sourceType = .camera
        //        imagePickerController.cameraCaptureMode = .video  //카메라랑 비디오만 넣으면 없는타입을
        //필요로 하기때문에 아래처럼 넣어줌
        imagePickerController.mediaTypes = [kUTTypeMovie as String]
        //reason: 'cameraCaptureMode 1 not available because mediaTypes does contain public.movie'
        imagePickerController.cameraCaptureMode = .video
        
        imagePickerController.cameraDevice = .front //전면카메라 설정
        imagePickerController.cameraFlashMode = .auto
        
        
        //        imagePickerController.cameraFlashMode = .off
        //        imagePickerController.cameraFlashMode = .on
        
        present(imagePickerController, animated: true)
        /*
         imagePickerController.sourceType = .camera
         //imagePickerController.cameraCaptureMode = .video
         //이 두개만 넣고 실행하면 아래처럼 오류 남.
         ---------- [ recordingVideo ] ----------
         
         2018-07-06 15:48:58.226205+0900 ImagePickerControllerExample[1009:130292] [MC] System group container for systemgroup.com.apple.configurationprofiles path is /private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles
         2018-07-06 15:48:58.227258+0900 ImagePickerControllerExample[1009:130292] [MC] Reading from public effective user settings.
         2018-07-06 15:48:58.242360+0900 ImagePickerControllerExample[1009:130292] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'cameraCaptureMode 1 not available because mediaTypes does contain public.movie'
         *** First throw call stack:
         (0x184786ab4 0x183a2c52c 0x1b05be910 0x10413abfc 0x10413acbc 0x1b03abf64 0x1b0418240 0x1b0418170 0x1b03abf64 0x1b04cfc6c 0x1b04cff8c 0x1b04cef8c 0x1b0b412d8 0x1b0b4253c 0x1b03c5bfc 0x1b03022d4 0x1b03048b4 0x1b02fd610 0x184715578 0x1847154f8 0x184714dd8 0x18470fc7c 0x18470f544 0x18696a570 0x1b03aab90 0x10413cea4 0x1841d213c)
         libc++abi.dylib: terminating with uncaught exception of type NSException
         // NSException 유형의 catch되지 않는 예외로 종료
         (lldb)
         
         // imagePickerController.mediaTypes = [kUTTypeMovie as String]를 추가해줌.
         */
        /*
         NSMicrophoneUsageDescription 부족하다는 오류 뜸. plist에 추가
         */
    }
    
    @IBAction private func toggleAllowsEditing(_ sender: Any) {
        print("\n---------- [ toggleAllowsEditing ] ----------\n")
        imagePickerController.allowsEditing = !imagePickerController.allowsEditing
        //true false 전환( 따로 코드를 그때그때 짜지 않기 위함)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //delegate 메서드가 구현되어 있지 않을 때는 기본적으로 선택 시 종료되도록 기본 구현되어 있음
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("didFinishPickingMediaWithInfo")
        
        //info[UIImagePickerControllerMediaType]
        //mediaType = info[UIImagePickerControllerMediaType] as! NSString
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeMovie){
            //Move
            let url = info[UIImagePickerControllerMediaURL] as! NSURL
            if let path = url.path {
                UISaveVideoAtPathToSavedPhotosAlbum(path, nil, nil, nil)
            }
        } else {
            //Image
            
            let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
            let selectedImage = editedImage ?? originalImage
            imageView.image = selectedImage
            //        imageView.image = originalImage
            //            imageView.image = editedImage ?? originalImage
            if let saveImage = selectedImage {
                UIImageWriteToSavedPhotosAlbum(saveImage, nil, nil, nil)
            }
            
        }
        //닫아버리기 전에 이부분으로 촬영된 사진으로 편집하는 기능을 추가해본다던지..
        
        /*
         imageView.image = info[UIImagePickerControllerOriginalImage] as! UIImage
         //Treating a forced downcast to 'UIImage' as optional will never produce 'nil'
         //imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
         //Use 'as?' to perform a conditional downcast to 'UIImage'
         //Add parentheses around the cast to silence this warning
         */
        
        picker.dismiss(animated: true) //닫기
    }
    
    
    /*********
     //앨범에 이미지 저장
     UIImageWriteToSavedPhotosAlbum()
     ********/
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePickerControllerDidCancel")
        picker.dismiss(animated: true)
    }
}
