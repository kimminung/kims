//
//  ViewController.swift
//  SignUp
//
//  Created by kimdaeman14 on 2018. 7. 1..
//  Copyright © 2018년 kimdaeman14. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let baseView = UIView()
    var topLayoutConstraint: NSLayoutConstraint?
    var imageView = UIImageView()
    let idTextField = UITextField()
    let pwTextField = UITextField()
    let signInButton = UIButton()
    let signUpButton = UIButton()
    let tapView = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        elementAttribute()
        autoLayoutAnchor()
        elementAction()
        idTextField.delegate = self
        pwTextField.delegate = self
        tapView.delegate = self

    }
    
    func addSubview(){
        view.addSubview(baseView)
        baseView.addSubview(imageView)
        baseView.addSubview(idTextField)
        baseView.addSubview(pwTextField)
        baseView.addSubview(signInButton)
        baseView.addSubview(signUpButton)
        view.addGestureRecognizer(tapView)
        
        
    }
    
    @objc func toSecondViewController(_: UIButton){
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true)

    }
    
    
    func elementAction(){
        signUpButton.addTarget(self, action: #selector(toSecondViewController(_:)), for: .touchUpInside)
        
    }
    
    
    func elementAttribute(){
        baseView.backgroundColor = UIColor.lightGray
        imageView.image = #imageLiteral(resourceName: "football-player")
        imageView.backgroundColor = .green
        idTextField.placeholder = "ID"
        idTextField.borderStyle = .roundedRect
        pwTextField.placeholder = "Password"
        pwTextField.borderStyle = .roundedRect
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.red, for: .normal)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.blue, for: .normal)
        

    }
    
    
    
    func autoLayoutAnchor(){
        baseView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        baseView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        baseView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        
        
        
        imageView.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10).isActive = true
        imageView.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 100).isActive = true
        imageView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -50).isActive = true
        imageView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -150).isActive = true
        
        idTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        idTextField.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
       
        pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 10).isActive = true
        pwTextField.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10).isActive = true
        pwTextField.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
        
        
        
        signInButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 10).isActive = true
        signInButton.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 100).isActive = true
        
        
        signUpButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 10).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -100).isActive = true
    
    }

}


extension ViewController : UIGestureRecognizerDelegate, UITextFieldDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("===================gestureRecognizer===================")
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("===================textFieldDidBeginEditing===================")
        topLayoutConstraint?.constant = (self.view.frame.height / 2) - 100

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("===================textFieldShouldReturn===================")
        self.view.endEditing(true)
        return true
    }
    
    
}

