//
//  ViewController.swift
//  ErrorHandling
//
//  Created by giftbot on 2018. 3. 13..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    /***************************************************
     func write(
     to url: URL,
     atomically useAuxiliaryFile: Bool,
     encoding enc: String.Encoding
     ) throws
     
     - throws 키워드 주목
     - "Swift".write(to: caches, atomically: true, encoding: .utf8)  // 컴파일 에러
     error - Call can throw, but it is not marked with 'try' and the error is not handled
     ***************************************************/
    
    private let tmpDir = NSTemporaryDirectory()
    private let filePath = NSTemporaryDirectory() + "swift.txt"
    private let errorFilePath = NSTemporaryDirectory() + "errorFile.txt"
    
    enum MyError: Error {
        case errorExample
        case errorWithParam(num: Int)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //    createDummyFile()
        
        //    basic()
        //    threeTypesOfTry()
        //    throwsFunctionExample()
        //    rethrowsFunctionExample()
        
        deferOrder()
        deferExample()
    }
    
    private func createDummyFile() {
        let swift = "Swift Error Handling"
        try? swift.write(toFile: filePath, atomically: true, encoding: .utf8)
    } //try?를 쓰면 do~catch를 하지 않아도 된다.
    
    // MARK: - Error handling basic
    
    private func basic() {
        print("\n---------- [ basic ] ----------\n")
        let swift = "Swift Error Handling"
        do {
            print("1")  //두캣치에서 에러가 발생되면 에러 아랫부분은 실행이 안된다(아래 트라이 다 주석 풀기)
            //      try swift.write(toFile: tmpDir, atomically: true, encoding: .utf8)  // Error  (tmpDir is Directory)
            print("2")
            try swift.write(toFile: filePath, atomically: true, encoding: .utf8)  // No Error
            print("3")
        } catch {    // <- catch 만 입력 시 기본적으로 let error 를 사용한 것과 동일
            print(error)
            print(error.localizedDescription)
            //print(error1.localizedDescription) //error에 변수명을 error1처럼 바꿔줄 수 있음
        }
        
        /***************************************************
         do ~ catch 블럭에서 위와 같이 첫 번째 try 문에서 에러가 발생하면 해당 코드 이후의 내용들은 실행되지 않음.
         즉 Error 가 나지 않는 두 번째 try 구문은 실행되지 않으므로 주의 필요
         ***************************************************/
    }
    
    
    // MARK: - try type
    
    private func threeTypesOfTry() {
        print("\n---------- [ try types ] ----------\n")
        /***************************************************
         try vs try? vs try!
         ***************************************************/
        
        // 1. try
        // do ~ catch 문 없이 단독 try 사용 불가. 컴파일 에러 -> Errors thrown from here are not handled
        //do써줘야함
        // try String(contentsOfFile: filePath)
        //catch써줘야함
        // try? 또는 try! 를 사용하면 do ~ catch 없이도 가능
        
        
        // 2. try?
        // 성공하면 Optional 값 반환, 에러가 발생하면 nil 반환
        let contentsOptional = try? String(contentsOfFile: filePath)
        // let contentsOptional = try? String(contentsOfFile: errorFilePath)
        print(contentsOptional)
        
        
        // 3. try!
        // Optional 강제 언래핑. 단, 에러 발생 시 Crash. 오류가 없다고 확신할 수 있는 경우만 사용
        let contentsUnwrapped = try! String(contentsOfFile: filePath)
        // let contentsUnwrapped = try! String(contentsOfFile: errorFilePath)
        print(contentsUnwrapped)
        
        
        /***************************************************
         주의
         ***************************************************/
        do {
            //    _ = try String(contentsOfFile: errorFilePath) //이게 먼저오면 아래try?부분이 실행되고 넘어감
            _ = try? String(contentsOfFile: errorFilePath)  // catch 구문으로 빠지지 않고 그냥 nil 반환
            //      _ = try! String(contentsOfFile: errorFilePath)  // do ~ catch 문이어도 Crash 발생
            _ = try String(contentsOfFile: errorFilePath)   // catch 블럭으로 넘어감
        } catch {
            print(error)
        }
    }
    
    
    // MARK: - throws
    
    private func throwsFunctionExample() {
        print("\n---------- [ throwsFunctionExample ] ----------\n")
        
        print("\n---------- [ NSError ] ----------\n")
        do {
            try throwNSError()
        } catch {
            print("Error :", error)
            print("Error LocalizedDescription :", error.localizedDescription)
            
            let e = error as NSError
            print("nserror :", e)
            print("domain :", e.domain)
            print("code :", e.code)
            print("userInfo :", e.userInfo)
        }
        
        print("\n---------- [ Custom Error ] ----------\n")
        do {
            try throwError()
        } catch let err {
            print("Error :", err)
            print("Error LocalizedDescription :", err.localizedDescription)
            
            let e = err as NSError
            print("nserror :", e)
            print("domain :", e.domain)
            print("code :", e.code)
            print("userInfo :", e.userInfo)
        }
        
        print("\n---------- [ Matching Error  ] ----------\n")
        do {
            try throwError()  //실제는 여기서 에러를 외부에서 처리함
        } catch MyError.errorExample {  //error과 NSError은 다르다
            print("errorExample")
        } catch MyError.errorWithParam(let num) {
            print("error with number param:", num)
        } catch {
            print("The error is not MyError")
        }
    }
    private func throwNSError() throws {  //error과 NSError은 다르다
        // NSError() - 기본 생성자 (X),  Domain cannot be nil
        // init(domain: String, code: Int, userInfo dict: [String : Any]? = nil)
        throw NSError(domain: "domain data", code: 55, userInfo: ["something": 1])
    }
    private func throwError() throws {
        // throws 메서드에서는 throw 를 통해 직접 에러를 던지거나
        // throws 메서드에 대해 do catch 문 없이 단순히 try 만을 사용할 수도 있다.
        //    try "1".write(toFile: tmpDir, atomically: true, encoding: .utf8)
        throw MyError.errorWithParam(num: 10)
    }
    
    // MARK: - rethrows
    
    private func someThrowsFunction() throws {    //외부 참조물
        throw MyError.errorExample
    }
    private func rethrowsFunctionExample() {  //외부 참조물
        someRethrowsFunction {}  // OK
        
        // Need to error handling
        do {
            try someRethrowsFunction {
                // ...
                throw MyError.errorExample
            }
        } catch {
            print(error)
        }
    }
    
    //    private func someRethrowsFunction(_ fn: ()-> ()) rethrows {   //rethrows는 throws라는 키워드가 있어야 사용 가능
    private func someRethrowsFunction(_ fn: () throws -> ()) rethrows {
        // 매개변수 부분
        // Error
        //    throw fn()        //외부 불가
        //    try someThrowsFunction()          //외부 불가
        //    throw MyError.errorExample        //외부 불가
        //    fn()        //아무 처리 안해줘서 안됌
        
        /*  1
         //    try fn()  // OK       //매개변수 식으로 가능(내가 리쓰로우 해주고있으니까 두캣치 안해줘도됨)
         */
        
        /*  2
         // 다음과 같이 메서드 내에서 자체 에러 처리할 수도 있음.
         //    try? someThrowsFunction() //내부 처리
         */
        
        /*  3
         //    do {
         //      try fn()
         //    } catch {
         //      print("nested error :", error)
         //    }
         */
    }
    
    
    // MARK: - defer  //미루다, 연기하다
    
    private func deferOrder() {
        print("\n---------- [ deferOrder ] ----------\n")
        print("start")
        defer { print("defer1") }
        print("center")
        defer { print("defer2") }
        defer { print("defer3") }
        print("end")
    }
    
    //    private func deferExample() {
    //        print("\n---------- [ deferExample ] ----------\n")
    //        defer { print("task1 - Must do something before return") }
    //        do {
    //            try throwError()
    //        } catch {
    //            print(error)
    //            return
    //        }
    //        // Do something here if no error occurred
    //        print("This is not called when error occurred")
    //        defer {
    //            print("This is not called when error occurred")
    //        }
    //    }
    //결과:errorWithParam(num: 10)
    //task1 - Must do something before return
    
    
    
    private func deferExample() {
        print("\n---------- [ deferExample ] ----------\n")
        defer { print("task1 - Must do something before return") }
        do {
            //            try throwError()
        } catch {
            print(error)
            return
        }
        // Do something here if no error occurred
        print("This is not called when error occurred")
        defer {
            print("This is not called when error occurred")
        }
    }
    //결과: This is not called when error occurred
    //    This is not called when error occurred
    //    task1 - Must do something before return
    
}
