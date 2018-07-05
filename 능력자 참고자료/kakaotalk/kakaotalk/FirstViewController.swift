//
//  FirstViewController.swift
//  kakaotalk
//
//  Created by kimdaeman14 on 2018. 7. 3..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit

class FirstViewController: UINavigationController {

    
    let tabBarCnt = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationBar.isTranslucent = false
//        tabBarItem.title = "title"
        view.backgroundColor = .yellow
        createTabBarController()
        
    }

    func createTabBarController() {
        
        let firstVc = UIViewController()
        firstVc.title = "First"
        firstVc.view.backgroundColor =  UIColor.red
        firstVc.tabBarItem = UITabBarItem.init(title: "First", image: UIImage(named: "findIcoID"), tag: 0)
        
        let controllerArray = [firstVc]
        tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
        
        self.view.addSubview(tabBarCnt.view)
    }
    
    

}
