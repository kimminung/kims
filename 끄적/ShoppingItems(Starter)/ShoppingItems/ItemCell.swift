//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2018. 6. 20..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

// MARK: - Class Implementation

final class ItemCell: UITableViewCell {
  
  // MARK: Properties
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var orderAmountLabel: UILabel!
  
    
    @IBAction private func addItem(_ sender:UIButton){
    
        
    }
  
  
}
