//
//  ViewController.swift
//  Class0604
//
//  Created by giftbot on 2018. 6. 4..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n---------- [ viewdidload ] ----------\n")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\n---------- [ viewwillAppear ] ----------\n")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\n---------- [ viewDidAppear ] ----------\n")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\n---------- [ viewWillDisappear ] ----------\n")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\n---------- [ viewDidDisappear ] ----------\n")
    }
    
    @IBAction private func showSecondViewController(_ button: UIButton) {
        let secondViewController = SecondViewController()
        //    secondViewController.view.backgroundColor = .orange
        
        present(secondViewController, animated: true) {
            print("Present Second View Controller")
        }
        //    print(self.presentedViewController)
    }
    
    //  @IBAction private func showSecondViewControllerUsingStoryboard(_ sender: Any) {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBAction private func showSecondViewControllerUsingStoryboard(_ sender: Any) {
        performSegue(withIdentifier: "ViewToSecond", sender: nil)
//        performSegue(withIdentifier: "ViewToSecond", sender: self)
    }
        /*
        //    if let secondViewController = storyboard.instantiateInitialViewController() {
        //      present(secondViewController, animated: true)
        //    }
        
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        //    let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController12")
        present(secondViewController, animated: true)
    }
 */
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) {
        let sourceViewController = sender.source
        print(sourceViewController)
        print(sender.destination)
    }
    

    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        print("---prepare---")
    }
    
    //넘길지 고민
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        print("----should----")
        return false
    }
    
    //performSegue 치고 자동완성
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier: identifier, sender: sender)
        print("perform")
        print(identifier)
        print(sender)
    }
}
