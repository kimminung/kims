//
//  ViewController.swift
//  LoginPage
//
//  Created by 변재우 on 20180607//.
//  Copyright © 2018 변재우. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBOutlet weak var FastCampusLogo: UIImageView!
    @IBOutlet weak var IDandPasswordView: UIView!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var passwordIcon: UIImageView!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    /* ---------- [Account Text Field] ---------- */
    
    @IBAction func AccountTextField(_ sender: Any) {
        print("\n-------------[touch up inside]---------------")
    }
    
    @IBAction func AccoundTextFieldEditingDidBegin(_ sender: Any) {
        print("\n-------------[editing did begin]---------------")
    }
    
    @IBAction func AccountTextFieldEditingDidEnd(_ sender: Any) {
        print("\n-------------[editing did end]---------------")
    }
    
    @IBAction func AccountTextFieldDidEndOnExit(_ sender: Any) {
        print("\n-------------[did end on exit]---------------")
    }
    
    @IBAction func AccountTextFieldEditingChanged(_ sender: UITextField) {
        print("\n-------------[editing changed]---------------")
    }
    
    
    /* ---------- [Password Text Field] ---------- */

    @IBAction func PasswordTextField(_ sender: Any) {
        print("\n-------------[touch up inside]---------------")
    }
    
    @IBAction func PasswordTextFieldEditingDidBegin(_ sender: Any) {
        print("\n-------------[editing did begin]---------------")
    }
    
    @IBAction func PasswordTextFieldDidEnd(_ sender: Any) {
        print("\n-------------[did end]---------------")
    }
    
    @IBAction func PasswordTextFieldDidEndOnExit(_ sender: Any) {
        print("\n-------------[did end on exit]---------------")
    }
    
    @IBAction func PasswordTextFieldEditingChanged(_ sender: UITextField) {
        print("\n-------------[editing changed]---------------")
    }
    
    /* ---------- [Button] ---------- */

    @IBAction func LoginButton(_ sender: UIButton) {
        if idTextField.text == "jaewoobyun" && pwTextField.text == "byunjaewoo"{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            guard storyboard.instantiateViewController(withIdentifier: "SecondViewController") is SecondViewController else { return }
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
           present(secondViewController, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Wrong ID or Password", message: "ID나 Password가 틀렸습니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                return
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
                return
            }))
            
            
            present(alert, animated: true)
        }
            
    }
        
        
        
}
    
    
    
    
    

