//
//  GestureViewController.swift
//  제스쳐,리코그나이져
//
//  Created by 김민웅 on 2018. 6. 26..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import UIKit


//제스쳐 구현
//스와이프
//핀치 제스쳐 - 줌,아웃
class GestureViewController: UIViewController {

    @IBOutlet private weak var imageView2: UIImageView!
    var isQuadruple = false
    
    @IBOutlet private weak var swipeGestureRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView2.layer.cornerRadius = imageView2.frame.width / 2
        imageView2.layer.masksToBounds = true
        
        swipeGestureRecognizer.direction = [.left, .right]
        
    }

    @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer) {
        if !isQuadruple {
            imageView2.transform = imageView2.transform.scaledBy(x: 2, y: 2)
        } else {
            imageView2.transform = CGAffineTransform.identity
        }
        isQuadruple = !isQuadruple
    }
    
    @IBAction private func handleRotationGeture(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        imageView2.transform = imageView2.transform.rotated(by: rotation)
        sender.rotation = 0
    }
    
    @IBAction private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: sender.view!)
        imageView2.center = point
    }
    
    @IBAction private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        imageView2.image = #imageLiteral(resourceName: "cat1")
    }
    
    @IBAction private func handleLeftSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        imageView2.image = #imageLiteral(resourceName: "cat2")
    }

}
