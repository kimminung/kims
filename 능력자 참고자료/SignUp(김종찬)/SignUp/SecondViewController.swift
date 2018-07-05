//
//  SecondViewController.swift
//  SignUp
//
//  Created by kimdaeman14 on 2018. 7. 1..
//  Copyright © 2018년 kimdaeman14. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let baseView = UIView()
    var profileImageView = UIImageView()
    let createIdTextField = UITextField()
    let createpwTextField = UITextField()
    let checkpwTextField = UITextField()
    let informationLabel = UILabel()
    let backButton = UIButton()
    let forwardButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        elementAttribute()
        autoLayoutAnchor()
        elementAction()
        
    }

    func elementAction(){
        forwardButton.addTarget(self, action: #selector(toThirdViewController(_:)), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backViewController(_:)), for: .touchUpInside)
        
    }
    
    @objc func toThirdViewController(_: UIButton){
        let thirdViewController = ThirdViewController()
        present(thirdViewController, animated: true)
        
    }
    
    @objc func backViewController(_: UIButton){
            dismiss(animated: true, completion: nil)
    }
    
    func addSubview(){
        view.addSubview(baseView)
        baseView.addSubview(profileImageView)
        baseView.addSubview(createIdTextField)
        baseView.addSubview(createpwTextField)
        baseView.addSubview(checkpwTextField)
        baseView.addSubview(informationLabel)
        baseView.addSubview(backButton)
        baseView.addSubview(forwardButton)

    }
   
    func elementAttribute(){
        profileImageView.backgroundColor = .red
        createIdTextField.placeholder = "ID"
        createIdTextField.borderStyle = .roundedRect
        createpwTextField.placeholder = "Password"
        createpwTextField.borderStyle = .roundedRect
        checkpwTextField.placeholder = "Check Password"
        checkpwTextField.borderStyle = .roundedRect
        informationLabel.backgroundColor = .orange
        profileImageView.backgroundColor = .gray
        backButton.setTitle("취소", for: .normal)
        backButton.setTitleColor(.red, for: .normal)
        forwardButton.setTitle("다음", for: .normal)
        forwardButton.setTitleColor(.blue, for: .normal)
    }
    func autoLayoutAnchor(){
        baseView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        createIdTextField.translatesAutoresizingMaskIntoConstraints = false
        createpwTextField.translatesAutoresizingMaskIntoConstraints = false
        checkpwTextField.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.translatesAutoresizingMaskIntoConstraints = false

        
        baseView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        baseView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 20).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10).isActive = true
        profileImageView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -250).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -555).isActive = true
        
        createIdTextField.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 20).isActive = true
        createIdTextField.leftAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: 140).isActive = true
        createIdTextField.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
        
        createpwTextField.topAnchor.constraint(equalTo: createIdTextField.bottomAnchor, constant: 20).isActive = true
        createpwTextField.leftAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: 140).isActive = true
        createpwTextField.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
        
        checkpwTextField.topAnchor.constraint(equalTo: createpwTextField.bottomAnchor, constant: 20).isActive = true
        checkpwTextField.leftAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: 140).isActive = true
        checkpwTextField.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
        
        informationLabel.topAnchor.constraint(equalTo: checkpwTextField.bottomAnchor, constant: 20).isActive = true
        informationLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10).isActive = true
        informationLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
        informationLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -60).isActive = true
        
        
        backButton.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 10).isActive = true
        backButton.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 100).isActive = true
        
        
        forwardButton.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 10).isActive = true
        forwardButton.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -100).isActive = true
    }

}
