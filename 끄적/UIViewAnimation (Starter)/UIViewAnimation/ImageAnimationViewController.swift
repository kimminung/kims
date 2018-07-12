//
//  ImageAnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2018. 7. 10..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ImageAnimationViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var repeatCountLabel: UILabel!
  
  let images = ["AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"].compactMap(UIImage.init(named:))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.animationImages = images
  }
  
  @IBAction private func startAnimation(_ sender: Any) {
    imageView.startAnimating()
  }
  
  @IBAction private func stopAnimation(_ sender: Any) {
    guard imageView.isAnimating else { return }
    imageView.stopAnimating()
  }
  
  @IBAction private func durationStepper(_ sender: UIStepper) {
    durationLabel.text = "\(sender.value)"
    
    // 1 Cycle Duration.
    // Default: 0.0 - 1/30 Second
    imageView.animationDuration = sender.value  //1사이클동안 속도가 사진 갯수의 30분의1초
  }
  
  @IBAction private func repeatCountStepper(_ sender: UIStepper) {
    let repeatCount = Int(sender.value)
    repeatCountLabel.text = "\(repeatCount)"
    
    // number of times to repeat the animation
    // Default: 0 - Indefinitely
    imageView.animationRepeatCount = repeatCount    //몇번 반복할건지
  }
}
