//
//  ViewController.swift
//  AutoLayoutEx
//
//  Created by 김승진 on 2018. 7. 6..
//  Copyright © 2018년 김승진. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func changeMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var graph1Height: NSLayoutConstraint!
    @IBOutlet private weak var graph2Height: NSLayoutConstraint!
    @IBOutlet private weak var graph3Height: NSLayoutConstraint!
    @IBOutlet private weak var graph4Height: NSLayoutConstraint!
    @IBOutlet private weak var graph5Height: NSLayoutConstraint!
    @IBOutlet private weak var graph6Height: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func change1(_ sender: UIButton) {
        graph1Height = graph1Height.changeMultiplier(multiplier: 0.5)
        graph2Height = graph2Height.changeMultiplier(multiplier: 0.7)
        graph3Height = graph3Height.changeMultiplier(multiplier: 0.35)
        graph4Height = graph4Height.changeMultiplier(multiplier: 0.9)
        graph5Height = graph5Height.changeMultiplier(multiplier: 0.8)
        graph6Height = graph6Height.changeMultiplier(multiplier: 1.0)
        
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func change2(_ sender: UIButton) {
        graph1Height = graph1Height.changeMultiplier(multiplier: 0.7)
        graph2Height = graph2Height.changeMultiplier(multiplier: 0.1)
        graph3Height = graph3Height.changeMultiplier(multiplier: 0.55)
        graph4Height = graph4Height.changeMultiplier(multiplier: 0.2)
        graph5Height = graph5Height.changeMultiplier(multiplier: 0.7)
        graph6Height = graph6Height.changeMultiplier(multiplier: 0.65)
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }


}

