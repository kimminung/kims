//
//  ViewController.swift
//  마이펫뀨뀨
//
//  Created by 김민웅 on 15/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tokkilabel = UILabel(frame: CGRect(x: view.frame.midX - 50, y: 100, width: 100, height: 50))
    lazy var tokkiImg = UIButton(frame: CGRect(x: view.frame.midX - 50, y: 100, width: 100, height: 100))
    
    lazy var gaelabel = UILabel(frame: CGRect(x: view.frame.midX - 50, y: 100, width: 100, height: 50))
    lazy var gaeImg = UIButton(frame: CGRect(x: view.frame.midX - 50, y: 210, width: 100, height: 100))
    
    lazy var goyanlabel = UILabel(frame: CGRect(x: view.frame.midX - 50, y: 100, width: 100, height: 50))
    lazy var goyanImg = UIButton(frame: CGRect(x: view.frame.midX - 50, y: 320, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//                tokkilabel.text = "0"
//        tokkilabel.text = "토끼"
        tokkilabel.textAlignment = .center
        
        tokkiImg.setImage(UIImage(named:"토끼"), for: .normal)
        tokkiImg.addTarget(self, action: #selector(tokki(_:)), for: .touchUpInside)
        view.addSubview(tokkiImg)
        
//                gaelabel.text = "0"
//        gaelabel.text = "개"
        gaelabel.textAlignment = .center
        
        gaeImg.setImage(UIImage(named: "개"), for: .normal)
        gaeImg.addTarget(self, action: #selector(gae(_:)), for: .touchUpInside)
        view.addSubview(gaeImg)
        
        
//                goyanlabel.text = "0"
//        goyanlabel.text = "고양이"
        goyanlabel.textAlignment = .center
        
        goyanImg.setImage(UIImage(named: "고양이"), for: .normal)
        goyanImg.addTarget(self, action: #selector(goyan(_:)), for: .touchUpInside)
        view.addSubview(goyanImg)
    }
    
    
    //
    @objc private func tokki(_ button:UIButton){
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true) {
            let text = secondViewController.tokkilabel.text
            let count = Int(text!)
            
            secondViewController.tokkilabel.text = "퇴끼가 \(count!+1)번 선택되었읍니다."
        }
    }
        
        /*
        let secondViewController = SecondViewController()
        
        present(secondViewController, animated: true){
        }
    }
    */
        
        
    /*
     let secondViewController = SecondViewController()
     present(secondViewController, animated: true){
     }
     secondViewController.tokkilabel.text = "0"
     */
    
    
    /*
     let secondViewController = SecondViewController()
     present(secondViewController, animated: true) {
     let text = secondViewController.tokkilabel.text
     let count = Int(text!)
     
     secondViewController.tokkilabel.text = "퇴끼가 \(count! + 1)번 선택되었읍니다."
     }
     
     }*/
    
    
    
    /*
     guard let secondViewController = presentingViewController as? SecondViewController,
     //        present(secondViewController, animated: true) {
     let text = secondViewController.tokkilabel.text,
     let count = Int(text)
     else{return}
     
     secondViewController.tokkilabel.text = "토끼가 \(count + 1)번 선택되었읍니다."
     dismiss(animated: true)
     }
     }
     */
    @objc private func gae(_ button:UIImage){
        let dog = Dog()
        present(dog, animated: true) {
            let text = dog.gaelabel.text
            let count = Int(text!)
            
            dog.gaelabel.text = "개가 \(count! + 1)번 선택되었읍니다."
        }
    }
    
    @objc private func goyan(_ button:UIImage){
        let cat = Cat()
        present(cat, animated: true) {
            let text = cat.goyanlabel.text
            let count = Int(text!)
            
            cat.goyanlabel.text = "고양이가 \(count! + 1)번 선택되었읍니다."
        }
    }
    
    
    
    
}
