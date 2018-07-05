//
//  ViewController.swift
//  kakaotalk
//
//  Created by kimdaeman14 on 2018. 7. 3..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let thridVC = ThirdViewController()
        let fourthVC = FourthViewController()
        
        firstVC.tabBarItem.title = "친구"
        secondVC.tabBarItem.title = "채팅"
        thridVC.tabBarItem.title = "채널"
        fourthVC.tabBarItem.title = "더보기"
        
        firstVC.tabBarItem.image = #imageLiteral(resourceName: "findIcoID")
        secondVC.tabBarItem.image = #imageLiteral(resourceName: "passlockIcoImage01")
        thridVC.tabBarItem.image = #imageLiteral(resourceName: "findIcoShake")
        fourthVC.tabBarItem.image = #imageLiteral(resourceName: "passlockIcoDelete")
        
        viewControllers = [firstVC, secondVC, thridVC, fourthVC]
        
        
        
        
     

    }


}
