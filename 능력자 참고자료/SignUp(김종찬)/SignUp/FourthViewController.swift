//
//  FourthViewController.swift
//  SignUp
//
//  Created by kimdaeman14 on 2018. 7. 1..
//  Copyright © 2018년 kimdaeman14. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let label = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 100))
        
        label.text = "가입이완료되었습니다."
        
        view.addSubview(label)
    }

   

}
