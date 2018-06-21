//
//  DrinkContainerView.swift
//  StopOutTestExample
//
//  Created by giftbot on 2018. 6. 14..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

protocol DrinkItemViewDelegate: class {
  func drinkItemView(_ drinkItemView: DrinkItemView, didTapItemCost cost: Int)
}

final class DrinkItemView: UIView {

  // MARK: Properties
  
  weak var delegate: DrinkItemViewDelegate?
  
  private let button = UIButton()
  private let imageView = UIImageView()
  private let costLabel = UILabel()
  private var costLabelHeight: CGFloat { return bounds.height * 0.2 }
  
  // MARK: Initialization
  
  init(frame: CGRect, item: DrinkItem) {
    super.init(frame: frame)
    setupView()
    setupItem(item)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Setup
  
  private func setupView() {
    backgroundColor = .green
    
    button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    addSubview(button)
    
    imageView.contentMode = .scaleAspectFit
    addSubview(imageView)
    
    costLabel.textAlignment = .center
    costLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
    addSubview(costLabel)
  }
  
  private func setupItem(_ item: DrinkItem) {
    costLabel.text = "\(item.cost)원"
    imageView.image = UIImage(named: item.imageName)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    button.frame = bounds
    
    imageView.frame = CGRect(
      x: 0, y: 0, width: bounds.width, height: bounds.height - costLabelHeight
    )
    
    costLabel.frame = CGRect(
      x: 0, y: bounds.height - costLabelHeight, width: bounds.width, height: costLabelHeight
    )
  }
  
  // MARK: Action Handler
  
  @objc func buttonDidTap(_ button: UIButton) {
    guard let itemCost = Int(costLabel.text!.dropLast()) else { return }
    delegate?.drinkItemView(self, didTapItemCost: itemCost)
  }
}
