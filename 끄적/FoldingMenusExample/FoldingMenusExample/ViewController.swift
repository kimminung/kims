//
//  ViewController.swift
//  FoldingMenusExample
//
//  Created by giftbot on 2018. 3. 18..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  struct Time {
    static let short = 0.3
    static let middle = 0.65
    static let long = 1.0
  }
  
  private struct UI {
    static let menuCount = 5
    static let menuSize: CGFloat = 50
    static let distance: CGFloat = 130
    static let minScale: CGFloat = 0.2
  }
  
  private var firstMenuContainer: [UIButton] = []
  private var secondMenuContainer: [UIButton] = []
  
  // MARK: - Setup UI
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupFirstMenu()
    setupSecondMenu()
  }
  
  private func randomNumberGenerator(maximum: UInt32) -> CGFloat {
    return CGFloat(arc4random_uniform(maximum))
  }
  
  private func randomColorGenerator() -> UIColor {
    let red = randomNumberGenerator(maximum: 255) / 255.0
    let green = randomNumberGenerator(maximum: 255) / 255.0
    let blue = randomNumberGenerator(maximum: 255) / 255.0
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
  }
  
  private func makeMenuButtonWith(frame: CGRect, title: String) -> UIButton {
    let button = UIButton(frame: frame)
    button.backgroundColor = randomColorGenerator()
    button.setTitle(title, for: .normal)
    button.layer.cornerRadius = button.bounds.width / 2
    button.transform = button.transform.scaledBy(x: UI.minScale, y: UI.minScale)
    view.addSubview(button)
    return button
  }
  
  private func setupFirstMenu() {
    for i in (0..<UI.menuCount) {
      let menuFrame = CGRect(x: 50, y: view.bounds.height - 110, width: UI.menuSize, height: UI.menuSize)
      let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
      firstMenuContainer.append(button)
      
      if i == 0 {
        button.transform = .identity
        button.addTarget(self, action: #selector(firstMenuDidTap(_:)), for: .touchUpInside)
      }
    }
    view.bringSubview(toFront: firstMenuContainer.first!)
  }
  
  private func setupSecondMenu() {
    for i in (0..<UI.menuCount) {
      let menuFrame = CGRect(x: 250, y: view.bounds.height - 110, width: UI.menuSize, height: UI.menuSize)
      let button = makeMenuButtonWith(frame: menuFrame, title: "버튼\(i)")
      secondMenuContainer.append(button)
      
      if i == 0 {
        button.transform = .identity
        button.addTarget(self, action: #selector(secondMenuDidTap(_:)), for: .touchUpInside)
      }
    }
    view.bringSubview(toFront: secondMenuContainer.first!)
  }
  
  // MARK: - ActionHandler
  
  @objc private func firstMenuDidTap(_ button: UIButton) {
    print("---------- [ usingSpringWithDamping ] ----------\n")
    button.isSelected = !button.isSelected
    
    UIView.animate(
      withDuration: Time.middle,
      delay: 0,
      usingSpringWithDamping: 0.5,
      initialSpringVelocity: 0.0,
      options: [],
      animations: { [firstMenuContainer] in
        for (idx, menu) in firstMenuContainer.enumerated() {
          guard idx != 0 else { continue }
          if button.isSelected {
            menu.transform = .identity
            menu.frame.origin.y -= UI.distance * CGFloat(idx)
          } else {
            menu.transform = menu.transform.scaledBy(x: UI.minScale, y: UI.minScale)
            menu.frame.origin.y += UI.distance * CGFloat(idx)
          }
        }
    })
  }
  
  @objc private func secondMenuDidTap(_ button: UIButton) {
    print("---------- [ animateKeyframes ] ----------\n")
    button.isSelected = !button.isSelected
    
    UIView.animateKeyframes(
      withDuration: Time.middle,
      delay: 0,
      options: [.beginFromCurrentState],
      animations: { [secondMenuContainer] in
        var startTime = 0.0
        var duration = 1.0 / Double(UI.menuCount)
        
        for i in 1..<UI.menuCount {
          defer { startTime += duration }
          UIView.addKeyframe(withRelativeStartTime: startTime, relativeDuration: duration, animations: {
            if button.isSelected {
              secondMenuContainer[i].transform = .identity
//              secondMenuContainer[i].transform = secondMenuContainer[i].transform.translatedBy(x: CGFloat(-30 * i), y: 0)
              secondMenuContainer.enumerated()
                .filter { return $0.offset >= i }
                .forEach { $0.element.frame.origin.y -= UI.distance }
            } else {
              let minimumScaleTransform = CGAffineTransform.identity.scaledBy(x: UI.minScale, y: UI.minScale)
              secondMenuContainer[UI.menuCount - i].transform = minimumScaleTransform
              secondMenuContainer.enumerated()
                .filter { return $0.offset >= UI.menuCount - i }
                .forEach { $0.element.frame.origin.y += UI.distance }
            }
          })
        }
    })
  }

}
