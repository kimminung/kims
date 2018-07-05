//
//  AppDelegate.swift
//  InboxDirectoryTest
//
//  Created by giftbot on 2018. 2. 27..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    print("\n-------------------- [ didFinishLaunchingWithOptions ] --------------------\n")
    return true
  }
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    // didFinishLaunchingWithOptions 호출된 이후 실행됨
    print("\n-------------------- [ open url with options ] --------------------\n")
    print("url :", url)
    print("source :", options[.sourceApplication] ?? "")
//    print(url.scheme)
//    print(url.query)
//
//    let fileManager = FileManager.default
//    if let contents = try? fileManager.contentsOfDirectory(atPath: NSHomeDirectory() + "/Documents" + "/Inbox") {
//      print("Documents/Inbox : ", contents)
//    }
//    let tmpDir = NSTemporaryDirectory() + "\(Bundle.main.bundleIdentifier!)-Inbox"
//    if let contents = try? fileManager.contentsOfDirectory(atPath: tmpDir) {
//      print("tmp/Inbox : ", contents)
//    }
    return true
  }
  
}

// [APP_CONTAINER]/tmp/[APP_BUNDLE_ID]-Inbox
// iOS 9부터.

// 현재 파일앱에서 아이템 여러 개 선택 후 share 했을 때 한 개의 파일만 import 되는 버그 있음

/***************************************************
 UIApplicationOpenURLOptionsKey
 ==============================
 sourceApplication
 - 앱을 열게 한 소스앱. ex) com.apple.DocumentsApp (파일앱)  , com.apple.mobilemail (메일앱)  ,  com.apple.Keynote(키노트)  ,  com.iwilab.KakaoTalk(카카오톡)
 
 openInPlace : 기본값 false,
 - 액세스 권한을 유지하기 위해 문서를 사용하기 전에 반드시 복사한 뒤 사용 해야 함.
   문서를 복사할 필요가 없는 경우 application(_:open:options:) 메서드 내에서 해당 문서를 바로 열 수 있음
   앱에서 iCloud 문서를 바로 열 수 있는지 여부를 선언하는 방법은 LSSupportsOpeningDocumentsInPlace 키 참고
 - LSSupportsOpeningDocumentsInPlace - Enables your app to directly open original documents
   값을 YES 로 설정하면, 문서 사본이 아닌 파일 제공자의 원본 문서를 열 수 있게 됨.
   opening documents in place 를 지원하는 시스템의 로컬 파일 프로바이더, 아이클라우드 파일 프로바이더, 써드파티 파일 프로바이더 의 문서에 접근 가능
 - iOS 11 에서 이 키와 UIFileSharingEnabled 키가 모두 YES 면 로컬 파일 provider 는 앱의 Documents 디렉토리에 있는 모든 문서에 대한 액세스 권한을 부여.
   이러한 문서들은 파일 앱 및 document browser 등에 보여지고, 유저는 이 문서의 원본을 바로 열고 편집할 수 있다.
 
 // 메인 첨부파일, 카톡 다운로드 파일 등 UIDocumentInteractionController 를 통해 들어오는 파일은 Documents/inbox 로 들어옴
 // iCloud 와 관련된 파일앱, 키노트 등 UIDocument 종류는 tmp/[bundleID]-inbox 로 들어옴
 
 // inPlace 값이 1일 때 (원본 주소)    (값을 1로 설정해도 다른 앱에서 UIDocumentInteractionController 를 통해 들어오는 파일은 inPlace 값이 0으로 해서 Documents/Inbox 디렉토리로 들어옴)
 // file:///private/var/mobile/Library/Mobile%20Documents/com~apple~CloudDocs/Desktop/UITextViewTest/UITextViewTest/ViewController.swift
 // file:///private/var/mobile/Containers/Shared/AppGroup/93023004-FB74-4D85-B9E1-C7540DD67270/File%20Provider%20Storage/21472873/1yqcBD60iJmn7KUUnfaOO5Jim-UHEEhhZsmGdivo4-ts/%E1%84%80%E1%85%A1%E1%84%80%E1%85%A8%E1%84%87%E1%85%AE.gsheet
 
 // inPlace 값이 0일 때  (메일, iCloud, 다른 앱 순)
 // file:///private/var/mobile/Containers/Data/Application/4C58CD34-82B7-4F3A-BA0E-0A4E7859FEF5/Documents/Inbox/test-3.pdf
 // file:///private/var/mobile/Containers/Data/Application/4C58CD34-82B7-4F3A-BA0E-0A4E7859FEF5/tmp/kr.giftbot.tutorial-Inbox/ViewController.swift
 // file:///private/var/mobile/Containers/Data/Application/4C58CD34-82B7-4F3A-BA0E-0A4E7859FEF5/tmp/kr.giftbot.tutorial-Inbox/text.txt
 
 Annotation : 기본값 [:]
 - UIDocumentInteractionController 객체의 annotation 속성으로 전달되는 정보를 포함.
 - 값은 property list-typed object
 ***************************************************/

