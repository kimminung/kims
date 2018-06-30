//
//  GestureRecognizerViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2018. 6. 26..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class GestureRecognizerViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  var isQuadruple = false
  
  @IBOutlet private weak var swipeGestureRecognizer: UISwipeGestureRecognizer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.layer.masksToBounds = true
    
    swipeGestureRecognizer.direction = [.left, .right]
  }
  
  
  @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer) {
    if !isQuadruple {
      imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
    } else {
      imageView.transform = CGAffineTransform.identity
    }
    isQuadruple = !isQuadruple
  }
  
  @IBAction private func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
    let rotation = sender.rotation
    imageView.transform = imageView.transform.rotated(by: rotation)
    sender.rotation = 0
  }
  
  @IBAction private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
    let point = sender.location(in: sender.view!)
    imageView.center = point
  }
  
  @IBAction private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
    imageView.image = #imageLiteral(resourceName: "cat1")
  }
  
  @IBAction private func handleLeftSwipeGesture(_ sender: UISwipeGestureRecognizer) {
    imageView.image = #imageLiteral(resourceName: "cat2")
  }
}
