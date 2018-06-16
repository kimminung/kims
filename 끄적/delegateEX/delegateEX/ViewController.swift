//
//  DelViewController.swift
//  delegateEX
//
//  Created by 김민웅 on 07/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

//import Foundation
import UIKit

class ViewController: UIViewController, CustomViewDelegate, CustomButtonDelegate {
    
    let button = CustomButton(frame: CGRect(x: 100, y: 200, width: 200, height: 100))
    let customView = CustomView(frame: CGRect(x: 100, y: 250, width: 200, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.backgroundColor = .red
        button.delegate = self
        customView.backgroundColor = .green
        //        let customView = CustomView()
        customView.delegate = self      //self = 커스텀뷰에서 어떤 메소드를 실행시킬건데 그 메소드가 받아서 처리할놈을 전혀 모르니까 그 놈을 지정해서 그 객체에다가 viewFrameChanged실행시키려고 self지정
        view.addSubview(customView)
        view.addSubview(button)
        
    }
    func viewFrameChanged(newFrame: CGRect) {
        // CustomView 의 프레임이 변경될 때마다 실행할 코드 작성
        print("change Frame : \(newFrame)\n")
    }
}
