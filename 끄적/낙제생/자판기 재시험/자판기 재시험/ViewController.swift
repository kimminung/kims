//
//  ViewController.swift
//  자판기 재시험
//
//  Created by 김민웅 on 15/06/2018.
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
    
    var money : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colaImg.setImage(UIImage(named: "콜라"), for: .normal)
        colaImg.addTarget(self, action: #selector(colaBuy(_:)), for: .touchUpInside)
        view.addSubview(colaImg)
        
        ciderImg.setImage(UIImage(named: "사이다"), for: .normal)
        ciderImg.addTarget(self, action: #selector(ciderBuy(_:)), for: .touchUpInside)
        view.addSubview(ciderImg)
        
        kantataImg.setImage(UIImage(named: "칸타타"), for: .normal)
        kantataImg.addTarget(self, action: #selector(kantataBuy(_:)), for: .touchUpInside)
        view.addSubview(kantataImg)
        
        samdaImg.setImage(UIImage(named: "삼다수"), for: .normal)
        samdaImg.addTarget(self, action: #selector(samdaBuy(_:)), for: .touchUpInside)
        view.addSubview(samdaImg)
        
        chunWonButton.setTitle("1000원", for: .normal)
        chunWonButton.layer.cornerRadius = 50
        chunWonButton.backgroundColor = .orange
        chunWonButton.addTarget(self, action: #selector(inputChunWon(_:)), for: .touchUpInside)
        view.addSubview(chunWonButton)
        
        obekWonButton.setTitle("500원", for: .normal)
        obekWonButton.layer.cornerRadius = 50
        obekWonButton.backgroundColor = .orange
        obekWonButton.addTarget(self, action: #selector(inputObekWon(_:)), for: .touchUpInside)
        view.addSubview(obekWonButton)
        
        returnButton.setTitle("반환", for: .normal)
        returnButton.layer.cornerRadius = 50
        returnButton.backgroundColor = .orange
        returnButton.addTarget(self, action: #selector(returnMoney(_:)), for: .touchUpInside)
        view.addSubview(returnButton)
        
        colaLabel.text = "1000원"
        colaLabel.textAlignment = .center
        colaLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(colaLabel)
        
        ciderLabel.text = "800원"
        ciderLabel.textAlignment = .center
        ciderLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(ciderLabel)
        
        kantataLabel.text = "1500원"
        kantataLabel.textAlignment = .center
        kantataLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(kantataLabel)
        
        samdaLabel.text = "500원"
        samdaLabel.textAlignment = .center
        samdaLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(samdaLabel)
        
        resultLabel.text = "결과:"
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(resultLabel)
        
        changeLabel.text = "잔액:"
        changeLabel.textAlignment = .center
        changeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(changeLabel)
        
    }
    
    @objc func inputChunWon(_:UIButton){
        money += 1000
        resultLabel.text = "\(money)원이 입금되었읍니다."
        changeLabel.text = "현재잔액:\(money)"
    }
    
    @objc func inputObekWon(_:UIButton){
        money += 500
        resultLabel.text = "\(money)원이 입금되었읍니다."
        changeLabel.text = "현재잔액:\(money)"
    }
    
    @objc func returnMoney(_:UIButton){
        resultLabel.text = "\(money)원이 반한되었읍니다."
        money = 0
        changeLabel.text = "현재잔액:\(money)"
    }
    
    @objc func colaBuy(_:UIButton){
        if(money<1000){
            resultLabel.text = "\(1000 - money)원이 부족합니다. 돈좀 넣어주십쇼."
            changeLabel.text = "현재잔액:\(money)"
        }else{
            money -= 1000
            resultLabel.text = "콜라 나왔읍니다."
            changeLabel.text = "현재잔액:\(money)"
        }
    }
    
    @objc func ciderBuy(_:UIButton){
        if(money<800){
            resultLabel.text = "\(800 - money)원이 부족합니다. 돈좀 넣어주십쇼."
            changeLabel.text = "현재잔액:\(money)"
        }else{
            money -= 800
            resultLabel.text = "사이다 나왔읍니다."
            changeLabel.text = "현재잔액:\(money)"
        }
    }
    
    @objc func kantataBuy(_:UIButton){
        if(money<1500){
            resultLabel.text = "\(1500 - money)원이 부족합니다. 돈좀 넣어주십쇼."
            changeLabel.text = "현재잔액:\(money)"
        }else{
            money -= 1500
            resultLabel.text = "칸타타 나왔읍니다."
            changeLabel.text = "현재잔액:\(money)"
        }
    }
    
    @objc func samdaBuy(_:UIButton){
        if(money<500){
            resultLabel.text = "\(500 - money)원이 부족합니다. 돈좀 넣어주십쇼."
            changeLabel.text = "현재잔액:\(money)"
        }else{
            money -= 500
            resultLabel.text = "삼다수 나왔읍니다."
            changeLabel.text = "현재잔액:\(money)"
        }
    }
}




