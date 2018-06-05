//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2018. 6. 5..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  struct Key {
    static let today = "kTODAY"
    static let alertOn = "kAlertOn"
  }
    //객체의 속성을 변경해줄일이 있으면 아울렛
  @IBOutlet private weak var datePicker: UIDatePicker!
  @IBOutlet private weak var alertSwitch: UISwitch!
  
  @IBAction func saveData(_ button: UIButton) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(datePicker.date, forKey: Key.today)    //date타입 - Any 형태
    userDefaults.set(alertSwitch.isOn, forKey: Key.alertOn) //On/Off - Bool 형태
  }
  
  @IBAction func loadData(_ button: UIButton) {
    let userDefaults = UserDefaults.standard
    guard let today = userDefaults.object(forKey: Key.today) as? Date else { return }
    
//    datePicker.setDate(today, animated: true)
    datePicker.date = today
    alertSwitch.setOn(userDefaults.bool(forKey: Key.alertOn), animated: true)
    
  }
}

