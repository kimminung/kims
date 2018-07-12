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
//    uiTaskOnBackgroundThread()
//    performanceTest()
//    concurrentQueue()
//    initiallyInactiveQueue()
//    groupNotify()
    performDispatchWorkItem()
  }

  private func bigTaskOnMainThread() {
    print("big task start")
    for _ in 0...900_000_000 { _ = 1 + 1 }
    print("big task end. start UI task")
    view.backgroundColor = .magenta
  }
  
  private func uiTaskOnBackgroundThread() {
    DispatchQueue.global().async { [weak self] in
//      for _ in 0...900_000_000 { _ = 1 + 1 }
      
//      DispatchQueue.main.async {
        self?.testView.frame.origin.y += 250
        self?.view.backgroundColor = .yellow
//      }
    }
  }
  
  private func performanceTest() {
    let serialQueue = DispatchQueue(label: "test.serialQueue")
    let concurrentQueue = DispatchQueue(label: "test.concurrentQueue", attributes: [.concurrent])
    let maxCount = 60_000
    
    measurePerformance {
      print("= serialQueue.async =")
      for _ in 1...maxCount {
        serialQueue.async { }
      }
    }
    measurePerformance {
      print("= serialQueue.sync =")
      for _ in 1...maxCount {
        serialQueue.sync { }
      }
    }
    measurePerformance {
      print("= concurrentQueue.async =")
      for _ in 1...maxCount {
        concurrentQueue.async { }
      }
    }
    measurePerformance {
      print("= concurrentQueue.sync =")
      for _ in 1...maxCount {
        concurrentQueue.sync { }
      }
    }
  }
  
  private func createDispatchWorkItem() -> DispatchWorkItem {
    let workItem = DispatchWorkItem {
      let bigNumber = 20_000_000
      let divideNumber = 5_000_000
      for i in 1...bigNumber {
        i % divideNumber == 0 ? print(i / divideNumber * 25, "%") : ()
      }
      print("done")
    }
    return workItem
  }
  
  private func concurrentQueue() {
    print("\n---------- [ concurrentQueue ] ----------\n")
    
    let workItem = createDispatchWorkItem()
    let myQueue = DispatchQueue(label: "kr.giftbot.myQueue", attributes: .concurrent)
    myQueue.async(execute: workItem)
//    myQueue.sync(execute: workItem)
    
    print("before waiting")
//    workItem.wait()    // wait 를 사용했을 때와 아닐 때 비교해보기
    print("after waiting")
  }
  
  
  private func initiallyInactiveQueue() {
    print("\n---------- [ initiallyInactiveQueue ] ----------\n")
    let bigNumber = 20000000
    let divideNumber = 5000000
    
    let workItem = createDispatchWorkItem()
    let myQueue = DispatchQueue(label: "kr.giftbot.myQueue", attributes: .initiallyInactive)
    
    myQueue.async(execute: workItem)
    for i in 1...bigNumber {
      i % divideNumber == 0 ? () : ()
    }
    print(" = end = ")
    myQueue.activate()   // activate 안 했을 때와 비교
  }
  
  private func groupNotify() {
    let group = DispatchGroup()
    let queue1 = DispatchQueue(label: "kr.giftbot.example.queue1")
    let queue2 = DispatchQueue(label: "kr.giftbot.example.queue2")
    let queue3 = DispatchQueue(label: "kr.giftbot.example.queue3")
    
    queue1.async(group: group) {
      print("queue1 시작")
      for _ in 0...990_000_000 { _ = 1 + 1 }
      print("queue1 완료")
    }
    queue2.async(group: group) {
      print("queue2 시작")
      for _ in 0...400_000_000 { _ = 1 + 1 }
      print("queue2 완료")
    }
    queue3.async(group: group) {
      print("queue3 시작")
      for _ in 0...10_000_000 { _ = 1 + 1 }
      print("queue3 완료")
    }
    group.notify(queue: .main) {
      print("전체 완료")
    }
  }
  
  func performDispatchWorkItem() {
    var number = 2
    let workItem = DispatchWorkItem {
      number += 3
    }
    workItem.perform()
    
    // DispatchQueue.global().async(execute: workItem)
    
    workItem.notify(queue: DispatchQueue.global()) {
      print("number :", number)
    }
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



