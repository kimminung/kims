//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2018. 7. 10..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
  
  @IBOutlet private weak var userIdLabel: UITextField!
  @IBOutlet private weak var passwordLabel: UITextField!
  @IBOutlet private weak var loginButton: UIButton!
  @IBOutlet private weak var countDownLabel: UILabel!
  var count = 5
  
    let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(activityIndicatorView)
    view.backgroundColor = .gray
  }
  
  @IBAction private func didEndOnExit(_ sender: Any) {
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    userIdLabel.center.x = -view.frame.width
    passwordLabel.center.x = -view.frame.width
    loginButton.center.x = -view.frame.width
    countDownLabel.isHidden = true
  }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            //        UIView.animate(withDuration: <#T##TimeInterval#>, animations: <#T##() -> Void#>, dismiss(animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>))//completion: 끝나고 뭔가 실행할거
            
            //    self.userIdLabel.center.x = self.userIdLabel.superview!.frame.midX
            self.userIdLabel.center.x = self.userIdLabel.superview!.bounds.midX
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.5, animations: {
            self.passwordLabel.center.x = self.passwordLabel.superview!.bounds.midX
        })
        
        UIView.animate(
            withDuration: 0.6,
            delay: 1,
            usingSpringWithDamping: 0.6,//튕겨내고
            initialSpringVelocity: 0.0,//가속도 - 높게 할수록 초기 가속도가 높아짐
//            options: [],
//            options:[.autoreverse, .repeat],    //반대로 튕겨지고 반복
            options: [.curveEaseIn],//처음에 느리다가 막바지에 갈수록 빨라짐
//            options:[.curveEaseOut],//반대
//            options:[.curveLinear],
//            options:[.curveEaseInOut/*, .repeat*/],
//            options:[curve]//노티피케이션 구현해서 넣기도 가능
            animations: {
                self.loginButton.center.x = self.loginButton.superview!.bounds.midX})
//            completion:{_ in
//                self.loginButton.center.x = -self.view.frame.width
//        })
    }
  
  
  @IBAction private func login(_ sender: Any) {
    guard !activityIndicatorView.isAnimating else {
        return self.activityIndicatorView.stopAnimating()
    }

  view.endEditing(true)
    
    activityIndicatorView.center = view.center
    activityIndicatorView.startAnimating()
    
    countDown()
    addAnimateKeyframes()
  }
    func countDown() {
        countDownLabel.isHidden = false
        countDownLabel.text = "\(count)"
        count -= 1
        
        UIView.transition(
            with: countDownLabel,
            duration: 0.33,
            options: [.curveEaseInOut, .transitionFlipFromBottom],
            animations: {
            
        }){ _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                if self.count > 0{  //재귀 들어감
                    self.countDown()
                } else {
                    self.countDownLabel.isHidden = true
                    self.count = 5
                    self.activityIndicatorView.stopAnimating()
                }
            })
        }
    }
  
  func addAnimateKeyframes() {
    let originalCenter = loginButton.center
    
    UIView.animateKeyframes(
        withDuration: 1.6,
        delay: 0.0,
        animations: {
                                    //시작시간               //25%만큼
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.loginButton.center.x += 50.0
                self.loginButton.center.y += 20.0
            })   //변곡점을 주는 역할(영상편집기 에서..)
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.loginButton.transform = CGAffineTransform(rotationAngle:  .pi / 4)
                self.loginButton.center.x += 100.0
                self.loginButton.center.y += 50.0
                self.loginButton.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
                self.loginButton.transform = .identity
                self.loginButton.center = CGPoint(
                    x: originalCenter.x,
                    y: self.loginButton.superview?.frame.maxY ?? 200.0
                )
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.loginButton.alpha = 1.0
                self.loginButton.center = originalCenter
            })
    })
  }
}
