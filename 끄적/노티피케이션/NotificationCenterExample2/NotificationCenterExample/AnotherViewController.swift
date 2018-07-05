//
//  AnotherViewController.swift
//  NotificationCenterExample
//
//  Created by giftbot on 2018. 7. 5..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit


let myNoti = Notification.Name.init("myNoti")

extension Notification.Name {
  static let myNoti2 = Notification.Name.init("kMyNoti2")
}

class AnotherViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(handleNoti(_:)),
      name: .myNoti2,
      object: nil
    )
  }
  
  @objc func handleNoti(_ noti: Notification) {
    print("handle Notification")
  }
  
  @IBAction private func didOnExit(_ sender: Any) {
    
  }
}
