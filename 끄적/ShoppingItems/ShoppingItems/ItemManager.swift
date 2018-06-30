//
//  ItemManager.swift
//  ShoppingItems
//
//  Created by giftbot on 2018. 6. 20..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import Foundation

struct ItemManager {
  
  let items: [ShoppingItem] = [
    ShoppingItem(title: "iPhone SE (Gold)", imageName: "iPhone8", stockHoldings: 4),
    ShoppingItem(title: "iPhone SE (RoseGold)", imageName: "iPhoneSE_RoseGold", stockHoldings: 5),
    ShoppingItem(title: "iPhone 8", imageName: "iPhoneSE_Gold", stockHoldings: 2),
    ShoppingItem(title: "iPhone X (White)", imageName: "iPhoneX_White", stockHoldings: 7),
    ShoppingItem(title: "iPhone X (Space Gray)", imageName: "iPhoneX_SpaceGray", stockHoldings: 9),
    
    ShoppingItem(title: "iPhone SE (Gold)1", imageName: "iPhone8", stockHoldings: 4),
    ShoppingItem(title: "iPhone SE (RoseGold)1", imageName: "iPhoneSE_RoseGold", stockHoldings: 5),
    ShoppingItem(title: "iPhone 81", imageName: "iPhoneSE_Gold", stockHoldings: 2),
    ShoppingItem(title: "iPhone X (White)1", imageName: "iPhoneX_White", stockHoldings: 7),
    ShoppingItem(title: "iPhone X (Space Gray)1", imageName: "iPhoneX_SpaceGray", stockHoldings: 9),
    
    ShoppingItem(title: "iPhone SE (Gold)2", imageName: "iPhone8", stockHoldings: 4),
    ShoppingItem(title: "iPhone SE (RoseGold)2", imageName: "iPhoneSE_RoseGold", stockHoldings: 5),
    ShoppingItem(title: "iPhone 82", imageName: "iPhoneSE_Gold", stockHoldings: 2),
    ShoppingItem(title: "iPhone X (White)2", imageName: "iPhoneX_White", stockHoldings: 7),
    ShoppingItem(title: "iPhone X (Space Gray)2", imageName: "iPhoneX_SpaceGray", stockHoldings: 9),
    
    ShoppingItem(title: "iPhone SE (Gold)3", imageName: "iPhone8", stockHoldings: 4),
    ShoppingItem(title: "iPhone SE (RoseGold)3", imageName: "iPhoneSE_RoseGold", stockHoldings: 5),
    ShoppingItem(title: "iPhone 83", imageName: "iPhoneSE_Gold", stockHoldings: 2),
    ShoppingItem(title: "iPhone X (White)3", imageName: "iPhoneX_White", stockHoldings: 7),
    ShoppingItem(title: "iPhone X (Space Gray)3", imageName: "iPhoneX_SpaceGray", stockHoldings: 9)
  ]
  
  func checkOrderAvailability(title: String, orderAmount: Int) -> Bool {
    guard let item = items.filter({ $0.title == title }).first,
      item.stockHoldings >= orderAmount + 1
      else { return false }
    return true
  }
}
