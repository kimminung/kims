//
//  ViewController.swift
//  TextFieldExample
//
//  Created by giftbot on 2018. 6. 6..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit



// Singleton
// UserDefaults

struct DataManager {
  static var shared = DataManager()
  private init() { }
  var text = ""
}


struct UserDefaultsKey {
  static let text = "textFieldText"
}


class ViewController: UIViewController {
  
  struct SegueRoute {
    static let actionSegue = "buttonActionSegue"
    static let manualSegue = "manualSegue"
  }

  @IBOutlet private weak var displayLabel: UILabel!
  @IBOutlet private weak var textField: UITextField!


  // MARK: - 데이터 전달 : 1) Storyboard 의 Button Action Segue 를 이용한 방식
  
  /***************************************************
   Storyboard 에서 Button 에 Segue 를 연결했을 때
   shouldPerformSegue -> prepare 순으로 실행
   ***************************************************/
  
  
  // shouldPerformSegue 를 굳이 구현할 필요 없을 경우는 생략 가능
  // 메서드 생략 시 모두 true 반환
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
    print("\n---------- [ shouldPerformSegue ] ----------")
    print("id :", identifier, "sender :", sender ?? "nil")
    return true
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // 이 메서드에서는 super 가 하는 일이 없어서 호출할 필요 없음.
    // 하지만 적지 않아도 된다는 것을 굳이 외우는 게 더 귀찮으므로 그대로 작성.
    super.prepare(for: segue, sender: sender)
    guard let id = segue.identifier else { return }
    print("\n---------- [ prepare ] ----------")
    print("id :", id, "sender :", sender ?? "nil")
    
    guard let secondVC = segue.destination as? SecondViewController else { return }
    // secondVC.displayLabel.text = textField.text   // Error
    secondVC.text = textField.text ?? ""
  }
  
  
  // MARK: - 데이터 전달 : 2) Manual Segue 를 이용한 방식
  
  /***************************************************
   ViewController 에서 다른 ViewController 로 직접 Segue 를 연결했을 때는
   직접 performSegue 메서드를 실행
   
   shouldPerformSegue -> performSegue -> prepare -> performSegue 나머지 코드
   ***************************************************/
  
  @IBAction private func showSecondViewControllerUsingManualSegue(_ sender: Any) {
    print("\n=============== [ 2. ManualSegue ] ===============")
    guard shouldPerformSegue(withIdentifier: SegueRoute.manualSegue , sender: sender) else { return }
    performSegue(withIdentifier: SegueRoute.manualSegue, sender: self)
  }
  
  override func performSegue(withIdentifier identifier: String, sender: Any?) {
    // super.performSegue 메서드에서 prepare 메서드 호출
    super.performSegue(withIdentifier: identifier, sender: sender)
    print("\n---------- [ performSegue ] ----------")
    print("performSegue :", identifier, "sender :", sender)
  }
  
  
  // MARK: - 데이터 전달 : 3) Present + Singleton/UserDefaults
  
  /***************************************************
   ***************************************************/
  
  @IBAction private func showSecondViewControllerUsingPresent(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
    
    // 프로퍼티에 직접 할당
    secondVC.text = textField.text ?? ""
    
//    UserDefatuls
//    UserDefaults.standard.set(textField.text, forKey: UserDefaultsKey.text)
    
    // Singleton
//    DataManager.shared.text =  textField.text ?? ""
    //삼항연산자, if 문에서 축약
    
    present(secondVC, animated: true)
  }
  
  
  
  // MARK: Unwind
  @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) {}
  
  
  // MARK: - TextField 이벤트 : 1) UIControl 을 이용한 방식

  @IBAction private func textFieldEditingDidBegin(_ sender: Any) {
    print("\n---------- [ textFieldEditingDidBegin ] ----------")
    displayLabel.textColor = .blue
  }
  
  @IBAction private func textFieldEditingChanged(_ sender: UITextField) {
    print("\n---------- [ textFieldEditingChanged ] ----------")
    displayLabel.text = sender.text
  }
  
  @IBAction private func textFieldDidEndOnExit(_ sender: Any) {
    print("\n---------- [ textFieldDidEndOnExit ] ----------")
  }
  
  @IBAction private func textFieldDidEnd(_ sender: Any) {
    print("\n---------- [ textFieldDidEnd ] ----------")
    displayLabel.textColor = .red
  }
}



// MARK: - TextField 이벤트 : 2) UITextFieldDelegate 를 이용한 방식

extension ViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    displayLabel.textColor = .blue
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    guard let text = textField.text else { return }
    displayLabel.text = text
    displayLabel.textColor = .red
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let text = (textField.text ?? "") + string
    displayLabel.text = text
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}

