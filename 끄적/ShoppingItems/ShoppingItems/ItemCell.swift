//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2018. 6. 20..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

// MARK: - Delegate

protocol ItemCellDelegate: class {
  func itemCell(_ itemCell: ItemCell, didTapAddButton: UIButton)
}


// MARK: - Class Implementation

final class ItemCell: UITableViewCell {
  
  // MARK: Properties
  
  @IBOutlet private weak var itemImageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var orderAmountLabel: UILabel!
  
  static let identifier: String = "ItemCell"
  weak var delegate: ItemCellDelegate?
  
  var title: String { return titleLabel.text! }
  var orderAmount = 0 {
    didSet {
      orderAmountLabel.text = "\(orderAmount)"
    }
  }
  
  // MARK: Action Handler
  
  func setupCell(title: String, imageName: String) {
    titleLabel.text = title
    itemImageView.image = UIImage(named: imageName)
  }
  
  @IBAction private func addItem(_ sender: UIButton) {
    delegate?.itemCell(self, didTapAddButton: sender)
  }
}
