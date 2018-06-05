//
//  ThirdViewController.swift
//  Class0604
//
//  Created by giftbot on 2018. 6. 4..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ThirdViewController: UIViewController {
  
  @IBOutlet private weak var thirdLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
//        self.modalTransitionStyle
//    UIModalTransitionStyle  //뷰 말고 뷰 컨트롤러의 속성 (present 하기 직전에 써줌)
    print("\n---------- [ Third viewdidload ] ----------\n")
  }
    
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\n---------- [ Third viewwillAppear ] ----------\n")
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("\n---------- [ Third viewDidAppear ] ----------\n")
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\n---------- [ Third viewWillDisappear ] ----------\n")
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("\n---------- [ Third viewDidDisappear ] ----------\n")
  }
  
  @IBAction private func dismissViewController(_ sender: Any) {
//    present <-> dismiss
    
//    dismiss(animated: true) {
//      print("Dismissed Third View Controller")
//    }
    
    /***************************************************
     presentedViewController  -> 내가 띄운 뷰컨트롤러
     presentingViewController -> 나를 띄우고 있는 뷰컨트롤러
     
     print(self.presentedViewController)    // -> nil ,
     print(self.presentingViewController)   // -> SecondViewController ,
     print(self.presentingViewController?.presentedViewController)  // ThirdViewController
     print(self.presentingViewController?.presentingViewController) // ViewController
     ***************************************************/
    
    presentingViewController?.dismiss(animated: true)     // -> secondViewController
    //presentingViewController?.presentingViewController?.dismiss(animated: true)
    // -> ViewController
  }
  
  deinit {
    print("ThirdViewController Deinit")
  }
}



