//
//  ViewController.swift
//  kim0705TapBar
//
//  Created by 김민웅 on 2018. 7. 5..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //델리게이트 - 정해진 객체에게만 전달,처리
    //노티 - 확성기 식으로 주변에 다 보이게 퍼트림(등록한 사람들에 대해서만) - 무전기
    //하나만 쓰기엔 용량 낭비(전체에게 뿌려주는 동작을 하기 때문에)
    //노티피케이션 - 코드 개발자가 시스템을 통해 알림을 받기 위한것(유저한테는 가리고 내부적 이벤트 처리할때 씀)
    
    let myNoti = Notification.Name.init("myNoti")
    let notiCenter = NotificationCenter.default
    //post - 어떤 알림을 퍼뜨리는놈
    override func viewDidLoad() {   //1번만 등록
        //deinit - removeObserver
        super.viewDidLoad()
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(handleNoti(_:)), name: myNoti, object: nil)
        
        //        NotificationCenter.default.addObserver(<#T##observer: Any##Any#>, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
        
        //정보를 어떤것을 원한다고 알려줘야함   //NSNotification.Name.생략 가능
        notiCenter.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: .main) { (noti) in
            print(noti)
            print("UIKeyboardWillShow")
        }
        //이름:이름.키보드가 나타날때 표시, 오브젝트:동작할(넘겨줄) 어떤 전달할 객체를 저장, 큐:쓰레드, 수행할 내용을 작성
        //NSNotification.Name.생략 가능
        notiCenter.addObserver(forName: NSNotification.Name.UIApplicationDidBecomeActive, object: nil, queue: .main) { (noti) in
            print(noti)
            print("UIApplicationDidBecomeActive")
        }
        
        //클로져 방식
        notiCenter.addObserver(forName: .UIDeviceOrientationDidChange, object: nil, queue: .main) { (noti) in
            print("UIDeviceOrientationDidChange")
        }
        
        notiCenter.addObserver(self, selector: #selector(deviceOrientationDidChange(_:)), name: .UIDeviceOrientationDidChange, object: nil)
        //여러번 입력할 수록 여러개 나타냄
        //        notiCenter.addObserver(self, selector: #selector(deviceOrientationDidChange(_:)), name: .UIDeviceOrientationDidChange, object: nil)
        //
        //        notiCenter.addObserver(self, selector: #selector(deviceOrientationDidChange(_:)), name: .UIDeviceOrientationDidChange, object: nil)
        
    }
    
    @IBAction private func postButton(_ sender: Any){
        NotificationCenter.default.post(name: .myNoti2, object: sender)
        print("postBTn")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //가상키보드 크기
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: .main) {
            guard let userInfo = $0.userInfo,
                let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
                let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
                let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
                else { return }
            print(keyboardFrame)
        }
        print("-----------viewWillAppear-----------")
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: .main) { _ in
            self.view.backgroundColor = .red
        }
        notiCenter.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        //        notiCenter.addObserver(self, selector: #selector(deviceOrientationDidChange(_:)), name: .UIDeviceOrientationDidChange, object: nil)
        //화면이 보일때마다 등록
        //화면이 사라질때마다 제거OV
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("-----------viewWillDisappear-----------")
        notiCenter.removeObserver(self) //셀프에 등록 된 옵저버 전체 제거
        notiCenter.removeObserver(self, name:NSNotification.Name.NSCalendarDayChanged, object: nil) //여러가지 중에 옵저버 하나만 제거
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardDidShow, object: nil, queue: .main){ _ in
            self.view.backgroundColor = .blue
        }
        notiCenter.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
    }
    @objc func deviceOrientationDidChange(_ noti: Notification) {
        print(noti)
        print("deviceOrientationDidChange")
    }
    
    @objc func keyboardWillShow(_ noti:Notification){
        print("---------keyboardWillShow----------")
        self.view.backgroundColor = .red
    }
    @objc func keyboardDidShow(_ noti:Notification){
        print("---------keyboardDidShow----------")
        self.view.backgroundColor = .blue
    }
    @objc private func handleNoti(_ noti:Notification){
        print("handle Notification")
    }
    @IBAction private func didOnExit(_ sender: Any) {
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //        tabBarController?
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

