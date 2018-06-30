//
//  ViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2018. 6. 26..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  var isHoldingImage = false
  var lastTouchPoint = CGPoint.zero
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.layer.masksToBounds = true
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    guard let touch = touches.first else { return }
    
    let touchPoint = touch.location(in: touch.view)
    if imageView.frame.contains(touchPoint) {
      imageView.image = UIImage(named: "cat2")
      isHoldingImage = true
    }
    lastTouchPoint = touchPoint
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    guard isHoldingImage, let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    imageView.center.x = imageView.center.x + (touchPoint.x - lastTouchPoint.x)
    imageView.center.y = imageView.center.y + (touchPoint.y - lastTouchPoint.y)
    lastTouchPoint = touchPoint
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    guard isHoldingImage else { return }
    isHoldingImage = false
    imageView.image = UIImage(named: "cat1")
  }
}
