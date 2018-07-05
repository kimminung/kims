//
//  ThirdViewController.swift
//  SignUp
//
//  Created by kimdaeman14 on 2018. 7. 1..
//  Copyright © 2018년 kimdaeman14. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    let baseView = UIView()
    let phoneNumberLabel = UILabel()
    let phoneNumberTextField = UITextField()
    let yymmddTextLabel = UILabel()
    let yymmddTextLabelShow = UILabel()
    let datePicker = UIDatePicker()
    let calcelButton = UIButton()
    let backButton = UIButton()
    let signUpButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        elementAttribute()
        elementAction()
        autoLayoutAnchor()
    }

    func elementAction(){
        signUpButton.addTarget(self, action: #selector(toFourthViewController(_:)), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backSecondController(_:)), for: .touchUpInside)
    }
    
    @objc func backSecondController(_: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func toFourthViewController(_: UIButton){
        let fourthViewController = FourthViewController()
        present(fourthViewController, animated: true)
        
    }
    
    func addSubview(){
        view.addSubview(baseView)
        baseView.addSubview(phoneNumberLabel)
        baseView.addSubview(phoneNumberTextField)
        baseView.addSubview(yymmddTextLabel)
        baseView.addSubview(yymmddTextLabelShow)
        baseView.addSubview(datePicker)
        baseView.addSubview(calcelButton)
        baseView.addSubview(backButton)
        baseView.addSubview(signUpButton)

        
    }
   
    func elementAttribute(){
        phoneNumberLabel.text = "전화번호"
        phoneNumberTextField.borderStyle = .roundedRect
        yymmddTextLabel.text = "생년월일"
        yymmddTextLabelShow.text = "12312312"
        datePicker.backgroundColor = UIColor.lightGray
        calcelButton.setTitle("취소", for: .normal)
        calcelButton.setTitleColor(.red, for: .normal)
        backButton.setTitle("이전", for: .normal)
        backButton.setTitleColor(.blue, for: .normal)
        signUpButton.setTitle("가입", for: .normal)
        signUpButton.setTitleColor(.blue, for: .normal)
    }
    func autoLayoutAnchor(){
        baseView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        yymmddTextLabel.translatesAutoresizingMaskIntoConstraints = false
        yymmddTextLabelShow.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        calcelButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

        
        baseView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        baseView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        
        phoneNumberLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 30).isActive = true
        phoneNumberLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10).isActive = true
        
        phoneNumberTextField.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 60).isActive = true
        phoneNumberTextField.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10).isActive = true
        phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        yymmddTextLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 100).isActive = true
        yymmddTextLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10).isActive = true
        
        yymmddTextLabelShow.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 100).isActive = true
        yymmddTextLabelShow.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20).isActive = true
        
        datePicker.topAnchor.constraint(equalTo: baseView.topAnchor, constant:150).isActive = true
        datePicker.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 30).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -30).isActive = true
       
        calcelButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30).isActive = true
        calcelButton.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 50).isActive = true
        
        backButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30).isActive = true
        backButton.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 180).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -50).isActive = true
        
        
    }

    

}
