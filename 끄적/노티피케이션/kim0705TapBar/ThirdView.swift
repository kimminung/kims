//
//  ThirdView.swift
//  kim0705TapBar
//
//  Created by 김민웅 on 2018. 7. 5..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation
import UIKit

class ThirdView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---------333viewDidLoad---------")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("---------333viewWillAppear---------")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("---------333viewWillLayoutSubviews---------")
    }
    deinit {
        print("333deinit")
    }
}
