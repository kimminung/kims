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
    guard let settingURL = URL(string: UIApplicationOpenSettingsURLString),
      UIApplication.shared.canOpenURL(settingURL)
      else { return }
    
    if #available(iOS 10.0, *) {
      UIApplication.shared.open(settingURL)
    } else {
      UIApplication.shared.openURL(settingURL)
    }
    
    /***************************************************
     open(<#T##url: URL##URL#>, options: <#T##[String : Any]#>, completionHandler: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
     - options: [UIApplicationOpenURLOptionUniversalLinksOnly: true]  (현재 옵션 한 개)
     - completionHandler: Open 성공 여부. mainThread 에서 비동기적으로 실행됨.
     
     UIApplication.shared.open(settingURL, options: [:]) { (isOpenSuccess) in
     print("isOpenSuccess :", isOpenSuccess)
     }
     ***************************************************/
  }
  
  @IBAction private func openMail(_ sender: Any) {
    print("\n---------- [ openMail ] ----------\n")
    let mailURL = URL(string: "mailto://")!
//    let mailURL = URL(string: "mailto://someone@mail.com")!   // 받는 사람 지정
    
    // Can't Open with Simulator
    // "This app is not allowed to query for scheme mailto"
    if UIApplication.shared.canOpenURL(mailURL) {
      UIApplication.shared.open(mailURL)
    }
  }

  @IBAction private func openMessage(_ sender: Any) {
    print("\n---------- [ openMessage ] ----------\n")
    let messageURL = URL(string: "sms:")!
//    let messageURL = URL(string: "sms://010-9999-9999")!    // 받는 사람 지정
    
    if UIApplication.shared.canOpenURL(messageURL) {
      UIApplication.shared.open(messageURL)
    }
  }
  
  @IBAction private func openWebsite(_ sender: Any) {
    print("\n---------- [ openWebsite ] ----------\n")
    let websiteURL = URL(string: "https://google.com")!
    if UIApplication.shared.canOpenURL(websiteURL) {
      UIApplication.shared.open(websiteURL)
    }
  }
  
  @IBAction private func openFacebook(_ sender: Any) {
    print("\n---------- [ openFacebook ] ----------\n")
    // 열리지 않음. canOpenURL - false.
    // 3rd Party 앱에 대해서 화이트리스트 등록 필요
    let facebookScheme = URL(string: "fb://")!
    if UIApplication.shared.canOpenURL(facebookScheme) {
      UIApplication.shared.open(facebookScheme)
    }
    print(UIApplication.shared.canOpenURL(facebookScheme))
  }
  
  /***************************************************
   iOS 9.0 부터 시스템 기본 앱을 제외한 앱에 대해 화이트 리스트 미등록시 canOpenURL 메서드 false 반환
   (단, canOpenURL 없이 그냥 open(url) 을 동작시키면 문제 없이 수행)
   
   [ Info.plist 에 scheme 화이트리스트 등록 방법 ]
   
   <key>LSApplicationQueriesSchemes</key>
   <array>
     <string>myApp</string>
   </array>
   ***************************************************/
  
  @IBAction private func openMyApp(_ sender: Any) {
    print("\n---------- [ openMyApp ] ----------\n")
    
    let myAppURL = URL(string: "myApp://")!
//    let myAppURL = URL(string: "myApp://?name=abc&age=10")!
    
    if UIApplication.shared.canOpenURL(myAppURL) {
      UIApplication.shared.open(myAppURL)
    }
    print(UIApplication.shared.canOpenURL(myAppURL))
  }
  
  
  /***************************************************
   - 웹브라우저 주소창에 myApp:// 라고만 쳐서 앱을 실행시킬 수도 있다.
   - URL(string: "myApp://?name=abc&age=10") 과 같이 scheme 뒤에 추가 쿼리를 붙여주면
     열리는 앱의 open url 메서드에서 url.scheme ("myApp"),
     url.query ("name=abc&age=10") 처럼 데이터를 받을 수 있다.
   ***************************************************/
}



/***************************************************
 [ 참고 Scheme ]
 전화 - tel://010-1234-5678"
 페이스타임 - facetime://010-1234-5678"
 애플맵 검색 텍스트 - http://maps.apple.com/?q=searchText
 애플맵 (위경도 지정) - http://maps.apple.com/?ll=latitude,longitude
 앱스토어 (구글맵) - https://itunes.apple.com/kr/app/google-maps/id585027354?mt=8
 유투브 - https://www.youtube.com/watch?v=BzYnNdJhZQw
 ***************************************************/






