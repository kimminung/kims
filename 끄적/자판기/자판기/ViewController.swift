//
//  ViewController.swift
//  자판기
//
//  Created by 김민웅 on 08/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DisplayDelegate, InputDelegate, DrinkItemDelegate {
    //콜라, 사이다 이미지
    let colaImg = DrinkItem(frame: CGRect(x: 2, y: 10, width: 200, height: 200))
    let ciderImg = DrinkItem(frame: CGRect(x: 202, y: 10, width: 200, height: 200))
    //콜라, 사이다 가격표
    let colaLabel = Display(frame: CGRect(x: 2, y: 210, width: 200, height: 30))
    let ciderLabel = Display(frame: CGRect(x: 202, y: 210, width: 200, height: 30))
    //칸타타, 삼다수 이미지
    let kantataImg = DrinkItem(frame: CGRect(x: 2, y: 240, width: 200, height: 200))
    let samdaImg = DrinkItem(frame: CGRect(x: 202, y: 240, width: 200, height: 200))
    //칸타타, 삼다수 가격표
    let kantataLabel = Display(frame: CGRect(x: 2, y: 440, width: 200, height: 30))
    let samdaLabel = Display(frame: CGRect(x: 202, y: 440, width: 200, height: 30))
    //결과, 잔액
    let resultLabel = Display(frame: CGRect(x: 2, y: 470, width: 402, height: 50))
    let changeLabel = Display(frame: CGRect(x: 2, y: 520, width: 402, height: 50))
    //버튼부
    let chunWonButton = Input(frame: CGRect(x: 2, y: 570, width: 134, height: 20))
    let obekWonButton = Input(frame: CGRect(x: 136, y: 570, width: 134, height: 20))
    let returnButton = Input(frame: CGRect(x: 270, y: 570, width: 134, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //
        colaImg.image = UIImage(named: "cola")
        view.addSubview(colaImg)
        //
        colaLabel.text = "1000"+"원"
        colaLabel.textAlignment = .center
        colaLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(colaLabel)
        //
        ciderImg.image = UIImage(named: "cider")
        view.addSubview(ciderImg)
        //
        ciderLabel.text = "800"+"원"
        ciderLabel.textAlignment = .center
        ciderLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(ciderLabel)
        //
        kantataImg.image = UIImage(named: "kantata")
        view.addSubview(kantataImg)
        //
        kantataLabel.text = "1500"+"원"
        kantataLabel.textAlignment = .center
        kantataLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(kantataLabel)
        //
        samdaImg.image = UIImage(named: "samda")
        view.addSubview(samdaImg)
        //
        samdaLabel.text = "500"+"원"
        samdaLabel.textAlignment = .center
        samdaLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        //
        resultLabel.text = "결과 : "
        resultLabel.textAlignment = .right
        resultLabel.font = UIFont.boldSystemFont(ofSize: 25)
        //
        changeLabel.text = "잔액 : "
        changeLabel.textAlignment = .right
        changeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        //
        chunWonButton.setTitle("1000"+"원", for: .normal)
        obekWonButton.setTitle("500"+"원", for: .normal)
        returnButton.setTitle("반환", for: .normal)
        //
        view.addSubview(samdaLabel)
        view.addSubview(resultLabel)
        view.addSubview(changeLabel)
        //
        view.addSubview(chunWonButton)
        view.addSubview(obekWonButton)
        view.addSubview(returnButton)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drink() {
        //음료
        
    }
    
    func display() {
        //구매가능한 결과물, 잔액
    }
    
    func input() {
        //잔액을 음료금액과 같게 입금하면 Input컨트롤러에서 반응
        
        if changeLabel.text == "\(colaLabel.text)" && changeLabel.text == "\(ciderLabel.text)" && changeLabel.text == "\(kantataLabel.text)" && changeLabel.text == "\(samdaLabel.text)"{
            present(self, animated: true)
        }else{
            let alert = UIAlertController(title: "금액 안맞음", message: "금액 안맞음", preferredStyle: .alert)
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

