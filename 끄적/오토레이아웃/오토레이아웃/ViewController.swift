//
//  ViewController.swift
//  오토레이아웃
//
//  Created by 김민웅 on 18/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    let view1 = UIView(frame: CGSize(x: 20, y: 20, width: 200, height: greatest))
    //
    //    let view2 = UIView(frame: CGSize(x: 230, y: 20, width: 200, height: greatest))
    private let view1 = UIView()
    private let view2 = UIView()
    
    override func viewDidLoad() {   //실행시 한번만 사용할것 주로 담을때 씀
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view1.backgroundColor = .gray
        view2.backgroundColor = .blue
        
        view.addSubview(view1)
        view.addSubview(view2)
        
        print("\n--------viewDidLoad------\n")
        print(view.safeAreaInsets)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let margin: CGFloat = 20
        let safeLayoutInsets = view.safeAreaInsets
        let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right
        
        let yOffset = safeLayoutInsets.top + margin
        let viewWidth = (view.bounds.midX - margin - 5 - (horizontalInset / 2))
        
        view1.frame = CGRect(x: safeLayoutInsets.left + margin,
                             y: yOffset,
                             width: viewWidth,
                             height: view.bounds.height - safeLayoutInsets.bottom - margin - yOffset)
        view2.frame = CGRect(origin: CGPoint(x: view1.frame.maxX + 10,
                                             y: yOffset), size: view1.bounds.size
            
        )
        print("\n---------viewLayoutSubviews-------\n")
        print(view.safeAreaInsets)
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //didload처럼 처음에 실행되지만 매번 실행을 함 *주의*
    //        <#code#>
    //    }
    //
    
}

