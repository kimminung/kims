//
//  ViewController.swift
//  Login
//
//  Created by 김민웅 on 07/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomButtonDelegate, CustomLoginDelegate, CustomTextDelegate {
    
    
    let id = CustomText(frame: CGRect(x: 50, y: 150, width: 100, height: 100))
    let pw = CustomText(frame: CGRect(x: 50, y: 300, width: 100, height: 100))
    let img = CustomLogin(frame: CGRect(x: 10, y: 10, width: 300, height: 100))
    let idImg = CustomLogin(frame: CGRect(x: 20, y: 150, width: 10, height: 10))
    let pwImg = CustomLogin(frame: CGRect(x: 20, y: 300, width: 10, height: 10))
    let login = CustomButton(frame: CGRect(x: 50, y: 500, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        id.customDelegate = self
        pw.customDelegate = self
        login.delegate = self
        img.image = UIImage(named: "FastCampus_Logo-2")
        idImg.image = UIImage(named: "userIcon")
        pwImg.image = UIImage(named: "passwordIcon")
        
        view.addSubview(idImg)
        view.addSubview(pwImg)
        view.addSubview(id)
        view.addSubview(pw)
        view.addSubview(login)
        view.addSubview(img)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func LoginButton() {
        if id.text == "minung" && pw.text == "1234"{
            present(self, animated: true)
        }else{
            let alert = UIAlertController(title: "id,pw x", message: "id,pw x", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                return
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
                return
            }))
            
            
            present(alert, animated: true)
        }
    }
    
    func min() {
        
    }
    
    func ung() {
        
    }
}

