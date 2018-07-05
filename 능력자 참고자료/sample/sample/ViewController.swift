//
//  ViewController.swift
//  sample
//
//  Created by kimdaeman14 on 2018. 6. 9..
//  Copyright © 2018년 kimdaeman14. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //콜라 버튼,레이블 선언 위치설정
    let colaImg = UIButton(frame: CGRect(x: 2, y: 10, width: 200, height: 200))
    let colaLabel = UILabel(frame: CGRect(x: 2, y: 210, width: 200, height: 30))
    //사이다 버튼,레이블 선언 위치설정
    let ciderImg = UIButton(frame: CGRect(x: 202, y: 10, width: 200, height: 200))
    let ciderLabel = UILabel(frame: CGRect(x: 202, y: 210, width: 200, height: 30))
    //칸타타 버튼,레이블 선언 위치설정
    let kantataImg = UIButton(frame: CGRect(x: 2, y: 240, width: 200, height: 200))
    let kantataLabel = UILabel(frame: CGRect(x: 2, y: 440, width: 200, height: 30))
    //삼다수 버튼,레이블 선언 위치설정
    let samdaImg = UIButton(frame: CGRect(x: 202, y: 240, width: 200, height: 200))
    let samdaLabel = UILabel(frame: CGRect(x: 202, y: 440, width: 200, height: 30))
    //결과, 잔액 레이블 선언 위치설정
    let resultLabel = UILabel(frame: CGRect(x: 2, y: 490, width: 402, height: 50))
    let changeLabel = UILabel(frame: CGRect(x: 2, y: 540, width: 402, height: 50))
    //버튼부 버튼 선언 위치설정
    let chunWonButton = UIButton(frame: CGRect(x: 22, y: 610, width: 100, height: 100))
    let obekWonButton = UIButton(frame: CGRect(x: 156, y: 610, width: 100, height:100))
    let returnButton = UIButton(frame: CGRect(x: 290, y: 610, width: 100, height: 100))
    //넣는돈, 반환되는 돈을 지칭하는 전역변수 선언, 초기값 설정
    //값이 계속 변경되어야 하므로 var.
    var money : Int = 0
    
    
    
    
    
    //뷰가 실행되면 발생하는 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //===============================button===============================
        //콜라버튼
        //Assets에 이미지를 넣으면 위의 방법으로 이름만 적어주면 이미지 삽입가능.
        colaImg.setImage(UIImage(named: "Journey-brands-Product-Coca-Cola-Classic"), for: .normal)
        //콜라버튼을 누르면 어떤 액션을 취하는 메소드를 연결해주는 작업.
        //self : 나를누르면, colaBuy(_:) 메소드를, touchUpInside 나를 클릭할 때 실행하겠다.
        colaImg.addTarget(self, action: #selector(colaBuy(_:)), for: .touchUpInside)
        view.addSubview(colaImg)
        //사이다버튼
        ciderImg.setImage(UIImage(named: "6HDh-_Mh_400x400"), for: .normal)
        ciderImg.addTarget(self, action: #selector(ciderBuy(_:)), for: .touchUpInside)
        view.addSubview(ciderImg)
        //칸타타버튼
        kantataImg.setImage(UIImage(named: "칸타타-스위트블랙-600x600"), for: .normal)
        kantataImg.addTarget(self, action: #selector(kantataBuy(_:)), for: .touchUpInside)
        view.addSubview(kantataImg)
        //삼다수버튼
        samdaImg.setImage(UIImage(named: "samda"), for: .normal)
         samdaImg.addTarget(self, action: #selector(samdaBuy(_:)), for: .touchUpInside)
        view.addSubview(samdaImg)
        //천원버튼
        chunWonButton.setTitle("1000"+"원", for: .normal)
        chunWonButton.layer.cornerRadius = 50 // 버튼 테두리 둥글게
        chunWonButton.backgroundColor = .gray
        chunWonButton.addTarget(self, action: #selector(inputChunWon(_:)), for: .touchUpInside)
        view.addSubview(chunWonButton)
        //오백원버튼
        obekWonButton.setTitle("500"+"원", for: .normal)
        obekWonButton.layer.cornerRadius = 50 // 버튼 테두리 둥글게
        obekWonButton.backgroundColor = .gray
        obekWonButton.addTarget(self, action: #selector(inputObekWon(_:)), for: .touchUpInside)
        view.addSubview(obekWonButton)
        //반환버튼
        returnButton.setTitle("반환", for: .normal)
        returnButton.layer.cornerRadius = 50 // 버튼 테두리 둥글게
        returnButton.backgroundColor = .gray
        returnButton.addTarget(self, action: #selector(returnMoney(_:)), for: .touchUpInside)
        view.addSubview(returnButton)
        //===================================================================

        
        
        
        
        //===============================label===============================
        //콜라레이블
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
        //===================================================================
    }
    
  
    //===============================method===============================

    //천원, 오백원버튼을 누르면 작동하는 메소드
    //스토리보드방식에서 메소드 연결할 때 @IBAction하는 것처럼, 코드방식에서도 메소드 연결할 때
    //@objc 키워드를 앞에 적어주어야함.
    //매개변수(입력)이 (_:UIButton) 라는 것은 버튼을 누르면 동작하겠다는 뜻.
    //(_:UIButton) 앞에 _: 부분은 _부분이 원래 설명하는 값, 예를들어 chunwon : uibutton 식으로
    //을 넣는 부분인데 메소드 자체에서 저 값을 사용할 필요가 없으므로 생략함(와일드카드 패턴이라고 불림)
    @objc func inputChunWon(_:UIButton){
        //천원버튼을 누르면, 돈이 천원이올라감.
        money += 1000
        //결과레이블값에 "\(money)원이 입금되었습니다."값을 넣는다.
        resultLabel.text = "\(money)원이 입금되었습니다."
        //잔액레이블값에 "현재잔액 : \(money)"값을 넣는다.
        changeLabel.text = "현재잔액 : \(money)"
    }
    @objc func inputObekWon(_:UIButton){
        //오백원버튼을 누르면, 돈이 오백원이올라감.
        money += 500
        resultLabel.text = "\(money)원이 입금되었습니다."
        changeLabel.text = "현재잔액 : \(money)"
    }
    //반환버튼을 누르면 작동하는 메소드
    @objc func returnMoney(_:UIButton){
        //반환버튼을 누르면 먼저 얼마를 반환했는지 알려주어야 하므로
        //현재 잔액이 결과값에 출력됨.
        resultLabel.text = "\(money)원이 반환되었습니다."
        //그리고 money값을 0으로 초기화시킴.
        money = 0
        //후에 잔액레이블에 현재잔액 다시 출력해서 보여줌.
        changeLabel.text = "현재잔액 : \(money)"
    }
    //콜라버튼을 누르면 작동하는 메소드
    @objc func colaBuy(_:UIButton){
        //콜라버튼을 누름
        //만약에 현재 잔액값인 money가 천원보다 낮으면 if문 출력
        if(money<1000){
            resultLabel.text = "\(1000 - money)원이 부족합니다. 돈을 넣어주세요."
            changeLabel.text = "현재잔액 : \(money)"
        }else{
        //아니라면 콜라를 구매했으니 콜라값 1000원을 money값에서 빼고 해당 결과를 레이블에 출력
            money -= 1000
            resultLabel.text = "콜라가 나왔습니다."
            changeLabel.text = "현재잔액 : \(money)"
        }
    }
    //사이다버튼을 누르면 작동하는 메소드
    @objc func ciderBuy(_:UIButton){
        if(money<800){
            resultLabel.text = "\(800 - money)원이 부족합니다. 돈을 넣어주세요."
            changeLabel.text = "현재잔액 : \(money)"
        }else{
            money -= 800
            resultLabel.text = "사이다가 나왔습니다."
            changeLabel.text = "현재잔액 : \(money)"
        }
    }
    //칸타타버튼을 누르면 작동하는 메소드
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
    //삼다수버튼을 누르면 작동하는 메소드
    @objc func samdaBuy(_:UIButton){
        if(money<500){
            resultLabel.text = "\(500 - money)원이 부족합니다. 돈을 넣어주세요."
            changeLabel.text = "현재잔액 : \(money)"
        }else{
            money -= 500
            resultLabel.text = "삼다수가 나왔습니다."
            changeLabel.text = "현재잔액 : \(money)"
        }
        
    }
    
    //===================================================================

    
}
