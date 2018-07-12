//
//  SlideController.swift
//  GadgetProject
//
//  Created by 김민웅 on 2018. 7. 11..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation
import UIKit



class SlideController: UIViewController {
    
    let colorBT = Notification.Name.init("cc")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---------SlideviewDidLoad---------")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        print("---------SlideviewWillAppear---------")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("---------SlideviewWillLayoutSubviews---------")
    }
    
    @IBOutlet weak var changeView: UIView!
    @IBAction func redSliderChanged(sender: UISlider) {
        let red = CGFloat(sender.value)
        changeView.backgroundColor = UIColor(
            red: red,
            green: 0.0,
            blue: 0.0,
            alpha: 1.0)
        //        displayColors()
    }
    
    @IBAction func greenSliderChanged(sender: UISlider) {
        let green = CGFloat(sender.value)
        changeView.backgroundColor = UIColor(
            red: 0.0,
            green: green,
            blue: 0.0,
            alpha: 1.0)
        //        displayColors()
    }
    @IBAction func blueSliderChanged(sender: UISlider) {
        let blue = CGFloat(sender.value)
        changeView.backgroundColor = UIColor(
            red: 0.0,
            green: 0.0,
            blue: blue,
            alpha: 1.0)
        //        displayColors()
    }
    
    @IBAction private func postButton(_ sender: Any){
        NotificationCenter.default.post(name: colorBT, object: sender)
        
        print("postBTn")
    }
    
    deinit {
        print("SlideDeinit")
    }
}
