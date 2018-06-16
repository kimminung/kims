//
//  ViewController.swift
//  자판기1
//
//  Created by 김민웅 on 10/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colaImg = UIButton(frame: CGRect(x: 2, y: 10, width: 200, height: 200))
    let colaLabel = UILabel(frame: CGRect(x: 2, y: 210, width: 200, height: 30))
    
    let ciderImg = UIButton(frame: CGRect(x: 202, y: 10, width: 200, height: 200))
    let ciderLabel = UILabel(frame: CGRect(x: 202, y: 210, width: 200, height: 30))
    
    let kantataImg = UIButton(frame: CGRect(x: 2, y: 240, width: 200, height: 200))
    let kantataLabel = UILabel(frame: CGRect(x: 2, y: 440, width: 200, height: 30))
    
    let samdaImg = UIButton(frame: CGRect(x: 202, y: 240, width: 200, height: 200))
    let samdaLabel = UILabel(frame: CGRect(x: 202, y: 440, width: 200, height: 30))
    
    let resultLabel = UILabel(frame: CGRect(x: 2, y: 490, width: 402, height: 50))
    let changeLabel = UILabel(frame: CGRect(x: 2, y: 540, width: 402, height: 50))
    
    let chunWonButton = UIButton(frame: CGRect(x: 22, y: 610, width: 100, height: 100))
    let obekWonButton = UIButton(frame: CGRect(x: 156, y: 610, width: 100, height: 100))
    let returnButton = UIButton(frame: CGRect(x: 290, y: 610, width: 100, height: 100))
    
    var money: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colaImg.setImage(UIImage(named: "Journey-brands-Product-Coca-Cola-Classic"), for: .normal)
        colaImg.addTarget(self, action:#selector(colaBuy(_:)), for: .touchUpInside)
        view.addSubview(colaImg)
        
        ciderImg.setImage(UIImage(named:"6HDh-_Mh_400x400"), for: .normal)
        ciderImg.addTarget(self, action:#selector(ciderBuy(_:)), for: .touchUpInside)
        view.addSubview(ciderImg)
        
        kantataImg.setImage(UIImage(named:"칸타타-스위트블랙-600x600"), for: .normal)
        kantataImg.addTarget(self, action:#selector(kantataBuy(_:)), for: .touchUpInside)
        view.addSubview(kantataImg)
        
        samdaImg.setImage(UIImage(named:"samda"), for: .normal)
        samdaImg.addTarget(self, action:#selector(samdaBuy(_:)), for: .touchUpInside)
        view.addSubview(samdaImg)
        
        
        chunWonButton.setTitle("1000원", for:.normal)
        chunWonButton.layer.cornerRadius = 50
        chunWonButton.backgroundColor = .gray
        chunWonButton.addTarget(self, action: #selector(inputChunWon(_:)), for: .touchUpInside)
        view.addSubview(chunWonButton)
        
        obekWonButton.setTitle("500원", for:.normal)
        obekWonButton.backgroundColor = .gray
        obekWonButton.addTarget(self, action: #selector(inputObekWon(_:)), for: .touchUpInside)
        view.addSubview(obekWonButton)
        
        
        returnButton.setTitle("반환", for: .normal)
        returnButton.layer.cornerRadius = 50
        returnButton.backgroundColor = .gray
        returnButton.addTarget(self,action:#selector(returnMoney(_:)), for: .touchUpInside)
        view.addSubview(returnButton)
        
        
        colaLabel.text = "1000"+"원"
        colaLabel.textAlignment = .center
        colaLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(colaLabel)
        //사이다레이블
        ciderLabel.text = "800"+"원"
        ciderLabel.textAlignment = .center
        ciderLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(ciderLabel)
        //칸타타레이블
        kantataLabel.text = "1500"+"원"
        kantataLabel.textAlignment = .center
        kantataLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(kantataLabel)
        //삼다수레이블
        samdaLabel.text = "500"+"원"
        samdaLabel.textAlignment = .center
        samdaLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(samdaLabel)
        //결과레이블
        resultLabel.text = "결과 : " //결과레이블 초기값
        resultLabel.textAlignment = .center //레이블 가운데 정렬
        resultLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(resultLabel)
        //잔액레이블
        changeLabel.text = "잔액 : " //잔액레이블 초기값
        changeLabel.textAlignment = .center //레이블 가운데 정렬
        changeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(changeLabel)
    }
    @objc func inputChunWon(_:UIButton){
        money += 1000
        
        resultLabel.text = "\(money)원이 입금되었습니다."
        changeLabel.text = "현재잔액: \(money)"
    }
    
    @objc func inputObekWon(_:UIButton){
        money+=500
        resultLabel.text = "\(money)원이 입금되었습니다."
        changeLabel.text = "현재잔액: \(money)"
    }
    @objc func returnMoney(_:UIButton){
        resultLabel.text = "\(money)원이 반환되었습니다."
        money = 0
        
        changeLabel.text = "현재잔액: \(money)"
    }
    @objc func colaBuy(_:UIButton){
        if(money<1000){
            resultLabel.text = "\(1000 - money)원이 부족합니다. 돈을 넣어주세요."
            changeLabel.text = "현재잔액 : \(money)"
        }else{
            money -= 1000
            resultLabel.text = "콜라가 나왔습니다."
            changeLabel.text = "현재잔액: \(money)"
        }
    }
    @objc func ciderBuy(_:UIButton){
        if(money<800){
            resultLabel.text = "\(800 - money)원이 부족합니다. 돈을 넣어주세요."
            changeLabel.text = "현재잔액 : \(money)"
        }else{
            money -= 800
            resultLabel.text = "사이다가 나왔습니다."
            changeLabel.text = "현재잔액 \(money)"
        }
    }
    @objc func kantataBuy(_:UIButton){
        if(money<1500){
            resultLabel.text = "\(1500 - money)원이 부족합니다. 돈을 넣어주세요."
            changeLabel.text = "현재잔액 : \(money)"
        }else{
            money -= 1500
            resultLabel.text = "칸타타가 나왔습니다."
            changeLabel.text = "현재잔액 : \(money)"
        }
    }
    @objc func samdaBuy(_:UIButton){
        if(money<500){
            resultLabel.text = "\(500 - money)원이 부족합니다. 돈을 넣어주세요."
            changeLabel.text = "현재잔액 : \(money)"
        }else{
            money -= 500
            resultLabel.text = "삼다수가 나왔습니다."
            changeLabel.text = "현재잔액: \(money)"
        }
    }
    
    
    
    
}

