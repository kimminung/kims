//
//  SecondViewController.swift
//  Class0604
//
//  Created by giftbot on 2018. 6. 4..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("\n---------- [ Second viewdidload ] ----------\n")
  }
  
  @IBAction private func showThirdViewController(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let thirdViewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")
    present(thirdViewController, animated: true)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\n---------- [ Second viewwillAppear ] ----------\n")
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("\n---------- [ Second viewDidAppear ] ----------\n")
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\n---------- [ Second viewWillDisappear ] ----------\n")
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("\n---------- [ Second viewDidDisappear ] ----------\n")
  }
  
  @IBAction func unwindToSecondViewController(_ sender: UIStoryboardSegue) {
    print("source :", sender.source)
    print("destination :", sender.destination)
  }
  
  deinit {
    print("Second View Controller Deinit")
  }
}
