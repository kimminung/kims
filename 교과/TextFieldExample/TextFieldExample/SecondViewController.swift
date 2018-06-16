//
//  SecondViewController.swift
//  TextFieldExample
//
//  Created by giftbot on 2018. 6. 6..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet weak var displayLabel: UILabel!
  var text = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // text 변수를 이용할 때
    displayLabel.text = text
    
    // UserDefaults 이용
//    if let text = UserDefaults.standard.object(forKey: UserDefaultsKey.text) as? String {
//      displayLabel.text = text
//    }
    
    // Singletone 이용
//    displayLabel.text = DataManager.shared.text
  }
  
}
