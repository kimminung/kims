//
//  ViewController.swift
//  제스쳐,리코그나이져
//
//  Created by 김민웅 on 2018. 6. 26..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var isHoldingImage = false
    
    var lastTouchPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.layer.cornerRadius = (imageView.frame.width)/2
        imageView.layer.masksToBounds = true    //자기의 영역을 벗어나는 이미지는 자르고 표시하겠다.
        
        
    }
    //클릭했을 때 이미지 교체
    //1. 클릭이 끝나는 순간 원본이미지로 교체
    
    //2. 이미지를 클릭했을 때만 반응하고 이미지 외부에서 클릭했을때는 무시하도록
    
    //3. 마우스 움직임을 따라서 이미지 뷰가 함께 움직이도록
    
    //4. 3번 문제 역시 이미지를 클릭했을때만 반응하도록
    
    //5. ImageView의 Corner에 TouchPoint를 바로 대입하는 대신 좀 더 자연스럽게 움직이도록 구현
    
    //터치하면 횟수늘어나고 찍은 좌표 표시되게
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("------touchesBegan------")
        
        guard let touch = touches.first else {return}   //첫번째 터치(옵셔널 제거하기 위해 가드문)
        
        let touchPoint = touch.location(in: touch.view)  //터치한 뷰를 기준으로 위치를 알려줌
        
        if imageView.frame.contains(touchPoint) {  //터치포인트에 있으면
            imageView.image = UIImage(named: "cat2")
            isHoldingImage = true
        }
        lastTouchPoint = touchPoint
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        //        print("------touchesMoved------")
        
        guard let touch = touches.first, isHoldingImage else {return}
        
        let touchPoint = touch.location(in: touch.view)
//    4번 푸는중    if /*end상태 이후면*/ {
//        imageView.center = touchPoint
//        }
        
    
        imageView.center.x = imageView.center.x + (touchPoint.x - lastTouchPoint.x)
        imageView.center.y = imageView.center.y + (touchPoint.y - lastTouchPoint.y)
        lastTouchPoint = touchPoint
    
//    touch.pre...
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("------touchesEnded------")
        imageView.image = UIImage(named: "cat1")
        
        isHoldingImage = false
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("------touchesCancelled------")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

