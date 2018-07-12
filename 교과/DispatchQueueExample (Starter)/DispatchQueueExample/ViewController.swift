//
//  ViewController.swift
//  DispatchQueueExample
//
//  Created by giftbot on 2018. 3. 19..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var testView: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //    bigTaskOnMainThread()
        //        uiTaskOnBackgroundThread()
        //            performanceTest()
        //    concurrentQueue()
//        initiallyInactiveQueue()
            groupNotify()
        //    performDispatchWorkItem()
    }
    
    private func bigTaskOnMainThread() {
        print("\n---------- [ uiTaskOnBackgroundThread ] ----------\n")
        print("big task start")
        for _ in 0...900_000_000 {
            _ = 1 + 1
        }
        print("big task end. start UI task")
        view.backgroundColor = .magenta
    }
    
    private func uiTaskOnBackgroundThread() {
        print("\n---------- [ uiTaskOnBackgroundThread ] ----------\n")
        print("big task start")
        /*
         DispatchQueue.global().async {
         for _ in 0...900_000_000 {  //글로벌 큐 안에
         _ = 1 + 1}
         print("end")
         }
         print("start")
         self.testView.frame.origin.y += 250
         self.view.backgroundColor = .yellow
         */            //  결과:   big task start
        //                        start
        //                        end
        
        /*
         DispatchQueue.global().async {
         [weak self] in
         
         //                for _ in 0...900_000_000 {  //글로벌 큐 안에
         //                    _ = 1 + 1
         //                }
         DispatchQueue.main.async{
         
         //                for _ in 0...900_000_000 {  //메인 안에는 UI관련 별도 처리
         //                    _ = 1 + 1
         //                }
         self?.testView.frame.origin.y += 250
         print("big task end. start UI task")
         self?.view.backgroundColor = .yellow
         }
         }*/
    }
    
    private func performanceTest() {
        print("\n---------- [ performanceTest ] ----------\n")
        //        let serialQueue =
    }
    
    private func createDispatchWorkItem() -> DispatchWorkItem {
        let workItem = DispatchWorkItem {
            
            print("done")
        }
        return workItem
    }
    
    private func concurrentQueue() {
        print("\n---------- [ concurrentQueue ] ----------\n")
        //.wait()
    }
    
    
    private func initiallyInactiveQueue() {
        print("\n---------- [ initiallyInactiveQueue ] ----------\n")
        let bigNumber = 20000000
        let divideNumber = 5000000
        
        let workItem = createDispatchWorkItem()
        let myQueue = DispatchQueue(label: "kr.giftbot.myQueue", attributes: .initiallyInactive)
        
        myQueue.async(execute: workItem)
        //        myQueue.activate()
        for i in 1...bigNumber {
            i % divideNumber == 0 ? () : ()
        }
        print("end")
        myQueue.activate()  //activate()
    }
    
    
    private func groupNotify() {
        print("\n---------- [ groupNotify ] ----------\n")
        
    }
    
    func performDispatchWorkItem() {
        print("\n---------- [ performDispatchWorkItem ] ----------\n")
        
    }
}

@discardableResult
func measurePerformance(block: ()->()) -> Double {
    let info = ProcessInfo.processInfo
    let begin = info.systemUptime
    block()
    let diff = info.systemUptime - begin
    print(diff, terminator: "\n\n")
    return diff
}



