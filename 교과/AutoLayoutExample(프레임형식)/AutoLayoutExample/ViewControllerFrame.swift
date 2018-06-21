//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by giftbot on 2018. 6. 17..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewControllerFrame: UIViewController {
  
  private let redView = UIView()
  private let blueView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    redView.backgroundColor = .red
    view.addSubview(redView)
    
    blueView.backgroundColor = .blue
    view.addSubview(blueView)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    let margin: CGFloat = 20
    let safeLayoutInsets = view.safeAreaInsets
    let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right
    
    let yOffset = safeLayoutInsets.top + margin
    let viewWidth = (view.bounds.midX - 20 - 5 - (horizontalInset / 2))
    
    
    redView.frame = CGRect(
      x: safeLayoutInsets.left + margin,
      y: yOffset,
      width: viewWidth,
      height: view.bounds.height - safeLayoutInsets.bottom - 20 - yOffset
    )
    
    blueView.frame = CGRect(
      origin: CGPoint(x: redView.frame.maxX + 10, y: yOffset),
      size: redView.bounds.size
    )
  }
}

