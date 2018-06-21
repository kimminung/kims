//
//  DrinkCost.swift
//  StopOutTestExample
//
//  Created by giftbot on 2018. 6. 14..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import Foundation

enum DrinkItem {
  case water
  case sprite
  case coke
  case cantata
  
  var imageName: String {
    switch self {
    case .water: return "water"
    case .sprite: return "sprite"
    case .coke: return "coke"
    case .cantata: return "cantata"
    }
  }
  
  var cost: Int {
    switch self {
    case .water: return 500
    case .sprite: return 800
    case .coke: return 1000
    case .cantata: return 1500
    }
  }
}
