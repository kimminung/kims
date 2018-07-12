//
//  AnotherViewController.swift
//  kim0705TapBar
//
//  Created by 김민웅 on 2018. 7. 5..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation
import UIKit


//let myNoti = Notification.Name.init("myNoti") //이런식보다

extension Notification.Name {   //이런식으로 쓰길 추천
    static let myNoti2 = Notification.Name.init("kMyNoti2")//강사님은 let(상수 표현)으로 앞에 k 붙임
}

class AnotherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(handleNoti(_:)), name: myNoti, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNoti(_:)), name: NSNotification.Name.myNoti2, object: nil)
    }
    
    @objc private func handleNoti(_ noti:Notification){
        print("handle Notification")
    }
    
    @IBAction private func didOnExit(_ sender: Any) {
        
    }
}
