//
//  ViewController.swift
//  delegateEX
//
//  Created by 김민웅 on 07/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

protocol CustomViewDelegate: class {
    
    func viewFrameChanged(newFrame:CGRect)
}
class CustomView: UIView {
    weak var delegate: CustomViewDelegate? // 프로토콜 타입의 변수
    
    override func layoutSubviews() {
        delegate?.viewFrameChanged(newFrame: frame)
        
    }
}


