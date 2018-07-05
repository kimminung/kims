//
//  ViewController.swift
//  NotificationCenterExample
//
//  Created by giftbot on 2018. 7. 4..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBAction private func postButton(_ sender: Any) {
    print("\n---------- [ postButton ] ----------\n")
    NotificationCenter.default.post(name: myNoti, object: sender)
  }
  
  @IBAction private func didOnExit(_ sender: Any) {

  }
  
  deinit {
//     NotificationCenter.default.removeObserver(self)
  }
}


