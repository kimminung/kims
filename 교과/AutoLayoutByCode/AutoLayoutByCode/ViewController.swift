//
//  ViewController.swift
//  AutoLayoutByCode
//
//  Created by giftbot on 2018. 6. 18..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  private let firstView = UIView()
  private let secondView = UIView()
  private let thirdView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstView.backgroundColor = .darkGray
    secondView.backgroundColor = .green
    thirdView.backgroundColor = .blue
    view.addSubview(firstView)
    firstView.addSubview(secondView)
    secondView.addSubview(thirdView)
    
//    setupAutoresizingMask()
    activateNSLayoutConstraintConstraints()
//    activateVisualFormat()
//    activateLayoutAnchors()
  }
  
  private func setupAutoresizingMask() {
    firstView.frame = CGRect(x: 50, y: 50, width: view.bounds.width - 100, height: view.bounds.height - 100)
    secondView.frame = CGRect(x: 40, y: 40, width: firstView.bounds.width - 80, height: firstView.bounds.height - 80)
    thirdView.frame = CGRect(x: 30, y: 30, width: secondView.bounds.width - 60, height: secondView.bounds.height - 60)
    
    //
    firstView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    secondView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//    thirdView.autoresizingMask = [.flexibleWidth]
//    thirdView.autoresizingMask = [.flexibleHeight]
    thirdView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
  }
  
  
  private func activateNSLayoutConstraintConstraints() {
    firstView.translatesAutoresizingMaskIntoConstraints  = false
    secondView.translatesAutoresizingMaskIntoConstraints  = false
    
    // FirstView <-> View
    NSLayoutConstraint(
      item: firstView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50
      ).isActive = true
    
    NSLayoutConstraint(
      item: firstView,
      attribute: .leading,
      relatedBy: .equal,
      toItem: view,
      attribute: .leading,
      multiplier: 1,
      constant: 50
      ).isActive = true
    
                                                    //constant -50을 프레임 기준으로 아래로 가게
                        //그냥 50으로 주려면 firstView아이템을 toItem으로 넣고 item에 view를 주면 된다.
    NSLayoutConstraint(item: firstView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -50).isActive = true
    
    NSLayoutConstraint(
      item: firstView, attribute: .trailing,
      relatedBy: .equal,
      toItem: view, attribute: .trailing,
      multiplier: 1, constant: -50
      ).isActive = true
    
    
    // SecondView <-> FirstView
    NSLayoutConstraint(item: secondView, attribute: .top, relatedBy: .equal, toItem: firstView, attribute: .top, multiplier: 1, constant: 40).isActive = true
    NSLayoutConstraint(item: secondView, attribute: .leading, relatedBy: .equal, toItem: firstView, attribute: .leading, multiplier: 1, constant: 40).isActive = true
    NSLayoutConstraint(item: secondView, attribute: .bottom, relatedBy: .equal, toItem: firstView, attribute: .bottom, multiplier: 1, constant: -40).isActive = true
    NSLayoutConstraint(item: secondView, attribute: .trailing, relatedBy: .equal, toItem: firstView, attribute: .trailing, multiplier: 1, constant: -40).isActive = true
    
    
//     firstView.addConstraint(<#T##constraint: NSLayoutConstraint##NSLayoutConstraint#>)  -> isActive property 사용
  }
  
  
  private func activateVisualFormat() {
    /***************************************************
     Visual Format Syntax
     https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html
     ***************************************************/
    
    firstView.translatesAutoresizingMaskIntoConstraints = false
    secondView.translatesAutoresizingMaskIntoConstraints = false
    
    let views: [String: Any] = ["firstView": firstView, "secondView": secondView]
    let metrics: [String: Any] = ["margin": 50]
    
    //행렬을 통해 직관적으로 표현 - "H:|-margin-[firstView]-margin-|"에서 |는 뷰 프레임을 의미
    var allConstraints: [NSLayoutConstraint] = []
    allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-margin-[firstView]-margin-|", metrics: metrics, views: views)
    allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-margin-[firstView]-margin-|", metrics: metrics, views: views)
    
    allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[secondView]-40-|", metrics: nil, views: views)
    allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[secondView]-40-|", metrics: nil, views: views)
    NSLayoutConstraint.activate(allConstraints)
  }
  

  private func activateLayoutAnchors() {
    // iOS 9.0
    
    firstView.translatesAutoresizingMaskIntoConstraints = false
    
    firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    
    secondView.translatesAutoresizingMaskIntoConstraints  = false
    secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 40).isActive = true
    secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 40).isActive = true
    secondView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -40).isActive = true
    secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -40).isActive = true
  }
}
