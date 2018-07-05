//
//  SecondViewController.swift
//  Practice1
//
//  Created by giftbot on 2018. 7. 5..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit


extension Notification.Name {
  static let colorWillSet = Notification.Name("kColorWillSet")
}

final class SecondViewController: UIViewController {
  
  @IBOutlet private weak var colorView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(setColorViewBackgroundColor(_:)), name: .colorWillSet, object: nil)
  }
  
  
  @objc private func setColorViewBackgroundColor(_ sender: Notification) {
    let postedColor = sender.object as! UIColor
    
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    if postedColor.getRed(&r, green: &g, blue: &b, alpha: &a) {
      print(r,g,b,a)
    }
    colorView.backgroundColor = postedColor
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}



