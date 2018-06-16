//
//  CustomView.swift
//  BasicDelegateExample
//
//  Created by giftbot on 2018. 6. 7..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

protocol CustomViewDelegate: class {
  func viewFrameChanged(newFrame:CGRect)
}

class CustomView: UIView {
  weak var delegate: CustomViewDelegate?
  
  override func layoutSubviews() {
    super.layoutSubviews()
    print("delegate :", delegate)
    delegate?.viewFrameChanged(newFrame: frame)
  }
}


