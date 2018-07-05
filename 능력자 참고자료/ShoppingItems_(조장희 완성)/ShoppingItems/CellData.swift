//
//  CellData.swift
//  ShoppingItems
//
//  Created by Jo JANGHUI on 2018. 6. 25..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import Foundation

enum appleItemData {
    case iPhone8
    case iPhoneSE_Gold
    case iPhoneSE_RoseGold
    case iPhoneX_SpaceGray
    case iPhoneX_White
    
    
    var itemName: String {
        switch self {
        case .iPhone8:  return "iPhone8"
        case .iPhoneSE_Gold:  return "iPhoneSE_Gold"
        case .iPhoneSE_RoseGold: return "iPhoneSE_RoseGold"
        case .iPhoneX_White: return "iPhoneX_White"
        case .iPhoneX_SpaceGray: return "iPhoneX_SpaceGray"
        }
    }
    
    var itemStrock: Int {
        switch self {
        case .iPhone8:  return 5
        case .iPhoneSE_Gold:  return 5
        case .iPhoneSE_RoseGold: return 5
        case .iPhoneX_White: return 5
        case .iPhoneX_SpaceGray: return 5
        }
    }
}

