//
//  SecondViewController.swift
//  DataTransfer
//
//  Created by giftbot on 2018. 6. 4..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  lazy var label = UILabel(frame: CGRect(x: view.frame.midX - 50, y: 100, width: 200, height: 50))
  lazy var button = UIButton(frame: CGRect(x: view.frame.midX - 50, y: 160, width: 100, height: 50))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    label.text = "SecondViewController"
    
    label.textAlignment = .center
    view.addSubview(label)
    
    button.backgroundColor = .blue
    button.setTitle("Button", for: .normal)
    button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    view.addSubview(button)
  }
  
  @objc private func buttonDidTap(_ button: UIButton) {
//    presented  -> 내가 띄우는 놈
//    presenting -> 나를 띄우는 놈
    
//     presentingViewController.label (x)
    // (presentingViewController as? ViewController)   // ViewController <- UIViewController
    

    guard let viewController = presentingViewController as? ViewController,
      let text = viewController.label.text,
      let count = Int(text)
      else { return }
    
    viewController.label.text = "\(count + 1)"
    dismiss(animated: true)
  }
}
