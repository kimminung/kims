//
//  ViewController.swift
//  Practice1
//
//  Created by giftbot on 2018. 7. 5..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet private weak var redSlider: UISlider!
  @IBOutlet private weak var greenSlider: UISlider!
  @IBOutlet private weak var blueSlider: UISlider!
  @IBOutlet private weak var alphaSlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction private func postSetColorNotification(_ sender: Any) {
    let color = UIColor(
      red: CGFloat(redSlider.value),
      green: CGFloat(greenSlider.value),
      blue: CGFloat(blueSlider.value),
      alpha: CGFloat(alphaSlider.value)
    )
    
    NotificationCenter.default.post(name: .colorWillSet, object: color)
  }
}

