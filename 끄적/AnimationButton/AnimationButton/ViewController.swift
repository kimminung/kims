//
//  ViewController.swift
//  AnimationButton
//
//  Created by 김민웅 on 2018. 7. 10..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var LeftBtn: UIButton!
    @IBOutlet private weak var RightBtn: UIButton!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let originL = LeftBtn.center
//        let originR = RightBtn.center
        
    }
    
    @IBAction private func moving(_ sender: Any) {

        leftMove()
        //  rightMove()
    }
    
    func leftMove(){
        
        let Btn = self.LeftBtn.frame
//        let LeftBtns = UIButton(frame: Btn)
//        //        let arr = [left]
//        LeftBtns.setTitle("\(self.count + 1)", for: .normal)
//        LeftBtns.layer.cornerRadius = 50
//        LeftBtns.backgroundColor = .orange
        
        for left in self.count...4 {
            //  Btn += left
            
            let LeftBtns = UIButton(frame: Btn)
            print(LeftBtn.frame)
            print("move")
            LeftBtns.setTitle("\(left)", for: .normal)
            LeftBtns.layer.cornerRadius = self.LeftBtn.frame.width / 2
            LeftBtns.layer.masksToBounds = true
            LeftBtns.backgroundColor = .orange
            
            UIView.animateKeyframes(
                withDuration: 1.6,
                delay: 0.0,
                animations: {
                    UIView.addKeyframe(
                        withRelativeStartTime: 0.0,
                        relativeDuration: 0.25,
                        animations: {
                            //LeftBtn의 bounds 기준으로 Y부터 -50 이동하고싶음
                            LeftBtns.center.y -= CGFloat(left + 1) * 50.0
                            print("gogo")
                    })
            })
            self.view.addSubview(LeftBtns)
            //            print(LeftBtns.frame)
        }
        
        //    func rightMove() {
        //        <#function body#>
        //    }
        
    }
}

