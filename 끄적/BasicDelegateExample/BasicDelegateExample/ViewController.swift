//
//  ViewController.swift
//  BasicDelegateExample
//
//  Created by giftbot on 2018. 6. 7..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate, CustomButtonDelegate/*, CustomTextDelegate*/ {

  let button = CustomButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
  let customView = CustomView(frame: CGRect(x: 100, y: 250, width: 200, height: 100))
//    let text = CustomText(frame: CGRect(x: 100, y: 250, width: 200, height: 100))
    
  override func viewDidLoad() {
    super.viewDidLoad()

    customView.backgroundColor = .green
    customView.delegate = self
    view.addSubview(customView)
  
    button.delegate = self
    view.addSubview(button)
//
//    text.delegete = self
//    view.addSubview(text)
  }
//    func kim() {
//        print("kim")
//    }

  func viewFrameChanged(newFrame: CGRect) {
    print("changed Frame : \(newFrame)\n")
  }

  func sayHello() {
    print("Hello Swift")
    let random = arc4random_uniform(100)
    customView.frame.size.height = CGFloat(random)
  }
}

