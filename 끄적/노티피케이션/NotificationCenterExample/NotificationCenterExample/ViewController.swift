//
//  ViewController.swift
//  NotificationCenterExample
//
//  Created by giftbot on 2018. 7. 4..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let notiCenter = NotificationCenter.default
  
  // 생성 시에 1번만 등록,  deinit 될 때 제거
  override func viewDidLoad() {
    super.viewDidLoad()

//    notiCenter.addObserver(self, selector: #selector(deviceOrientationDidChange(_:)), name: .UIDeviceOrientationDidChange, object: nil)
//    notiCenter.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: .main) { (noti) in
//      print("UIKeyboardWillShow")
//    }
  }
  
  // 화면이 보여질 때마다 등록,  화면이 사라질 때마다 제거
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\n---------- [ viewWillAppear ] ----------\n")
    notiCenter.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\n---------- [ viewWillDisappear ] ----------\n")
    notiCenter.removeObserver(self)
  }
  
  @IBAction private func keyboardWillShow(_ sender: Any) {
    self.view.backgroundColor = .red
    print("\n---------- [ UIKeyboardWillShow ] ----------\n")
  }
  
  @objc func deviceOrientationDidChange(_ noti: Notification) {
    print("\n---------- [ deviceOrientationDidChange ] ----------\n")
    print(noti)
  }
  
  @IBAction private func didOnExit(_ sender: Any) {

  }
  
  deinit {
     NotificationCenter.default.removeObserver(self)
  }
}


