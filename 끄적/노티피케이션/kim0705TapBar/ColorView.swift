//
//  ColorView.swift
//  kim0705TapBar
//
//  Created by 김민웅 on 2018. 7. 5..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation
import UIKit

extension Notification.Name {   //이런식으로 쓰길 추천
    static let myColor = Notification.Name.init("kMyColor")//강사님은 let(상수 표현)으로 앞에 k 붙임
}

class ColorView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---------cccccccviewDidLoad---------")
        NotificationCenter.default.addObserver(self, selector: #selector(colorChange(_:)), name: NSNotification.Name.myColor, object: nil)
    }
    
    @objc private func colorChange(_ noti:Notification){
        print("colorChange")
    
    }
    
//    @IBAction private func colorChangeRGB(_)
//    @IBAction private func changeBtn(_)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("---------ccccccccviewWillAppear---------")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("---------cccccccviewWillLayoutSubviews---------")
        
    }
    deinit {
        print("cccccccdeinit")
    }
}
