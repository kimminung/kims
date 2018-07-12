//
//  OtherBtn.swift
//  GadgetProject
//
//  Created by 김민웅 on 2018. 7. 11..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation
import UIKit

class OtherBtn: UIViewController {
    
    
    @IBOutlet weak var otherBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rotation(_ sender: Any) {
        UIView.animate(withDuration: 1.0, animations: ({
            self.otherBtn.transform = self.otherBtn.transform.rotated(by: 30)
            }))
    }
    
    @IBAction func rotateCancelled(_ sender: Any) {
        UIView.animate(withDuration: 1.0, animations: ({
            self.otherBtn.transform = self.otherBtn.transform.rotated(by: 0)
        }))
    }
    
    @IBAction func rotateDone(_ sender: Any) {
        UIView.animate(withDuration: 5.0, animations: ({
            self.otherBtn.transform = self.otherBtn.transform.rotated(by: 360)
            self.otherBtn.transform = self.otherBtn.transform.scaledBy(x: 2000, y: 2000)
        }))
    }
    
}
