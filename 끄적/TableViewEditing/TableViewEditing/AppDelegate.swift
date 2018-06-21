//
//  AppDelegate.swift
//  TableViewEditing
//
//  Created by giftbot on 2018. 6. 21..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    let rootViewController = ViewController()
    let naviController = UINavigationController(rootViewController: rootViewController)
    window?.rootViewController = naviController
    window?.makeKeyAndVisible()

    return true
  }
}
