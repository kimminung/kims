//
//  ExpandViewController.swift
//  AutoLayoutEx
//
//  Created by 김승진 on 2018. 7. 8..
//  Copyright © 2018년 김승진. All rights reserved.
//

import UIKit


class MyCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
}

class ExpandViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var heightArray: NSMutableArray = []
    var isSelected: Bool = false
    
    var textArray:[String] = ["shot Text",
                        "long long long long long long",
                        "very long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long",
                        "very long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long",
                        "very long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long very long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITableVIewAutomaticDimension을 쓸때는 estimatedHeightForRowAt delegate도 같이 써줘야된다.
        myTableView.rowHeight = UITableViewAutomaticDimension // cell의 치수를 계산하여 cell의 height값으로 넣는다.
        
        for _ in 0..<textArray.count {
            heightArray.add(false)
        }
    }
}

extension ExpandViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell", for: indexPath) as! MyCell
        
        cell.myLabel.text = textArray[indexPath.row]
        
        if heightArray[indexPath.row] as! Bool == false {
            cell.myLabel.numberOfLines = 1
        } else {
            cell.myLabel.numberOfLines = 0
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if heightArray[indexPath.row] as! Bool == false {
            heightArray.replaceObject(at: indexPath.row, with: true)

        } else {
            heightArray.replaceObject(at: indexPath.row, with: false)
        }
        
        tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
}
