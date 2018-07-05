//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2018. 7. 2..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction private func openSetting(_ sender: Any) {
        print("\n---------- [ openSettingApp ] ----------\n")
        
        guard let settingURL = URL(string:UIApplicationOpenSettingsURLString), UIApplication.shared.canOpenURL(settingURL)
            else {return}
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(settingURL)
            
        }else {
            UIApplication.shared.canOpenURL(settingURL)
        }
        /***************************
         UIApplication.shared.open(<#T##url: URL##URL#>, options: <#T##[String : Any]#>, completionHandler: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
         - options: [UIApplicationOpenURLOptionUniversalLinksOnly: true] (현재 옵션 한 개)
         - completionHandler: Open 성공 여부. mainThread 에서 비동기적으로 실행됨.
         
         UIApplication.shared.open(settingURL, options: [:]) {(isOpenSuccess) in
         print("isOpenSuccess:", isOpenSuccess)
         }
         ***************************/
    }
    
    @IBAction private func openMail(_ sender: Any) {
        print("\n---------- [ openMail ] ----------\n")
        
        //옵셔널처리는 원래 하면 안된다(삭제 가능한 어플이여도 앱이 죽음)
        let mailURL = URL(string: "mailto://")!
        //let mailURL = URL(string: "mailto://someone@mail.com")!   //받는 사람 지정
        
        //Can't Open with Simulator
        //"This app is not allowed to query for scheme mailto"
        if UIApplication.shared.canOpenURL(mailURL){
            UIApplication.shared.open(mailURL)
        }
    }
    
    @IBAction private func openMessage(_ sender: Any) {
        print("\n---------- [ openMessage ] ----------\n")
        
        let messageURL = URL(string: "sms:")!
        //let messageURL = URL(string: "sms://010-9999-9999")!
        
        if UIApplication.shared.canOpenURL(messageURL){
            UIApplication.shared.open(messageURL)
        }
    }
    
    @IBAction private func openWebsite(_ sender: Any) {
        print("\n---------- [ openWebsite ] ----------\n")
        
        let websiteURL = URL(string: "https://google.com")!
        if UIApplication.shared.canOpenURL(websiteURL){
            UIApplication.shared.open(websiteURL)
        }
    }
    
    @IBAction private func openFacebook(_ sender: Any) {
        print("\n---------- [ openFacebook ] ----------\n")
        //열리지 않음. canOpenURL - false.
        //3rd Party 앱에 대해서 화이트리스트 등록 필요 //내가 명확하게 허용한 앱인지 알려줄 수 있음
        let facebookScheme = URL(string:"fb://")!
        
        if UIApplication.shared.canOpenURL(facebookScheme){ //안전하게
            UIApplication.shared.open(facebookScheme)
        }
        print(UIApplication.shared.canOpenURL(facebookScheme))
    }
    
    @IBAction private func openMyApp(_ sender: Any) {
        print("\n---------- [ openMyApp ] ----------\n")
        let myAppURL = URL(string: "myApp://")!
        
        if UIApplication.shared.canOpenURL(myAppURL){
            UIApplication.shared.open(myAppURL)

            //    }
            print(UIApplication.shared.canOpenURL(myAppURL))
        }
    }
    @IBAction func openMap(_ sender: Any) {
        print("\n==map==\n")
        
        let mapURL = URL(string:"http://maps.apple.com/?ll=latitude,longitude")!
        
        if UIApplication.shared.canOpenURL(mapURL){
            UIApplication.shared.open(mapURL)
            print(UIApplication.shared.canOpenURL(mapURL))
        }
    }
}

//addingPercentEncoding(withAllowedCharacters:...


