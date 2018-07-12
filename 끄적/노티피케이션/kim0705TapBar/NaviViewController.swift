//
//  NaviViewController.swift
//  kim0705TapBar
//
//  Created by 김민웅 on 2018. 7. 5..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation
import UIKit

class NaviViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---------nnnnnnnviewDidLoad---------")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("---------nnnnnnnviewWillAppear---------")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("---------nnnnnnnnviewWillLayoutSubviews---------")
    }
    deinit {
        print("nnnnnnndeinit")
    }
}
