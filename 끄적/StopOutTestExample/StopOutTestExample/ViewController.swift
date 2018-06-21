//
//  ViewController.swift
//  StopOutTestExample
//
//  Created by giftbot on 2018. 6. 14..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  private struct UI {
    static let margin: CGFloat = 30
    static let padding: CGFloat = 10
    static let displayLabelHeight: CGFloat = 50
  }
  
  // MARK: Properties
  
  private let itemContainerView = UIView()
  private let displayLabel = UILabel()
  private var balance: Int = 0 {
    didSet {
      displayLabel.text = "잔액 : \(balance)원"
    }
  }
  private let insertMoneyButtonTitles = ["1000원", "500원", "반환"]
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: Setup
  
  private func setupUI() {
    placeItems()
    setupDisplayLabel()
    setupInsertMoneyButtons()
  }
  
  private func placeItems() {
    let items: [DrinkItem] = [.water, .sprite, .coke, .cantata]
    let itemViewWidth = view.frame.midX - UI.margin - UI.padding
    let itemViewHeight = itemViewWidth / 3 * 4
    
    itemContainerView.frame = CGRect(
      x: UI.margin, y: 100, width: (itemViewWidth + UI.padding) * 2, height: (itemViewHeight + UI.padding) * 2
    )
    view.addSubview(itemContainerView)
    
    for (idx, item) in items.enumerated() {
      let row = CGFloat(idx / 2)
      let column = CGFloat(idx % 2)
    
      let itemFrame = CGRect(
        x: column * (itemContainerView.bounds.midX + UI.padding),
        y: row * (itemContainerView.bounds.midY + UI.padding),
        width: itemViewWidth,
        height: itemViewHeight
      )
      
      let drinkItemView = DrinkItemView(frame: itemFrame, item: item)
      drinkItemView.delegate = self
      itemContainerView.addSubview(drinkItemView)
    }
  }
  
  private func setupDisplayLabel() {
    let containerFrame = itemContainerView.frame
    displayLabel.frame = CGRect(
      x: containerFrame.minX,
      y: containerFrame.maxY + UI.margin,
      width: containerFrame.width,
      height: UI.displayLabelHeight
    )
    displayLabel.textAlignment = .right
    displayLabel.textColor = .white
    displayLabel.backgroundColor = .black
    displayLabel.font = UIFont.preferredFont(forTextStyle: .title3)
    view.addSubview(displayLabel)
    
    balance = 0
  }
  
  private func setupInsertMoneyButtons() {
    let buttonWidth = (displayLabel.frame.width - (2 * UI.margin)) / 3
    
    for (idx, title) in insertMoneyButtonTitles.enumerated() {
      let buttonFrame = CGRect(
        x: UI.margin + ((buttonWidth + UI.margin) * CGFloat(idx)),
        y: displayLabel.frame.maxY + UI.margin,
        width: buttonWidth,
        height: UI.displayLabelHeight
      )
      let button = UIButton(frame: buttonFrame)
      button.setTitle(title, for: .normal)
      button.setTitleColor(.white, for: .normal)
      button.backgroundColor = .blue
      button.addTarget(self, action: #selector(insertMoney(_:)), for: .touchUpInside)
      view.addSubview(button)
    }
  }
  
  
  // MARK: Action Handler
  
  @objc private func insertMoney(_ button: UIButton) {
    guard let title = button.titleLabel?.text, title != insertMoneyButtonTitles.last else {
      balance = 0
      return
    }
    balance += Int(title.dropLast()) ?? 0
  }
}


// MARK: - DrinkItemViewDelegate

extension ViewController: DrinkItemViewDelegate {
  func drinkItemView(_ drinkItemView: DrinkItemView, didTapItemCost cost: Int) {
    guard balance >= cost else { return alertInsertCointMessage(coin: cost - balance) }
    balance -= cost
  }
  
  func alertInsertCointMessage(coin: Int) {
    let alertController = UIAlertController(title: "Insert Coin", message: "\(coin)원 부족", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true)
  }
}

