//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2018. 6. 20..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

protocol ItemCellDelegate: class {
    func itemCount(_ itemCell: ItemCell, button: UIButton)
}

// MARK: - Class Implementation
final class ItemCell: UITableViewCell {
    
    weak var delegate: ItemCellDelegate?
    
    var count: Int = 0 {
        didSet {
            orderAmoutLabel.text = "\(count)"
        }
    }
    
  // MARK: Properties
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var orderAmoutLabel: UILabel!
    
    @IBAction func addButton(_ sender: UIButton) {
        delegate?.itemCount(self, button: sender)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        self.backgroundColor = .white
    }
}
