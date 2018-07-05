//
//  dog.swift
//  마이펫뀨뀨
//
//  Created by 김민웅 on 15/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import Foundation
import UIKit

class Dog: UIViewController {
    
    lazy var gaelabel = UILabel(frame: CGRect(x: view.frame.midX - 50, y: 100, width: 100, height: 50))
    var gaeImg = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
    
    lazy var back = UIButton(frame: CGRect(x: view.frame.midX - 50, y:160, width: 100, height: 50))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gaelabel.text = "0"
        view.addSubview(gaelabel)
        gaeImg.setImage(UIImage(named: "개"), for: .normal)
        view.addSubview(gaeImg)
        
        back.backgroundColor = .blue
        back.setTitle("뒤로가기", for: .normal)
        back.addTarget(self, action: #selector(backTap(_:)), for: .touchUpInside)
        view.addSubview(back)
    }
    
    @objc private func backTap(_ button: UIButton){
        //토끼 눌러서 오면 토끼 보여주고 숫자 추가, 개면 개 보여 추가, 고양 고보추
        
        guard let viewController = presentingViewController as? Dog,
            let text = viewController.gaelabel.text,
            let count = Int(text)
            else{return}
        viewController.gaelabel.text = "\(count + 1)"
        dismiss(animated: true)
    }
}
