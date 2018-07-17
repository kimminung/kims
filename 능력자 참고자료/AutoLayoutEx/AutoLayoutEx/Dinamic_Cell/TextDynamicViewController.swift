//
//  TextDynamicViewController.swift
//  AutoLayoutEx
//
//  Created by 김승진 on 2018. 7. 8..
//  Copyright © 2018년 김승진. All rights reserved.
//

import UIKit


class EmailCell: UITableViewCell {
    
    @IBOutlet weak var contentsTitle: UILabel!
    
}

class TextDynamicViewController: UIViewController {

    @IBOutlet weak var emailTableView: UITableView!
    
    var email:[String] = ["title","long title", "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long text"]
    var isExpand:[Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITableVIewAutomaticDimension을 쓸때는 estimatedHeightForRowAt delegate도 같이 써줘야된다.
        emailTableView.rowHeight = UITableViewAutomaticDimension
        
        for _ in 0..<email.count {
            isExpand.append(false)
        }
    }
}

extension TextDynamicViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return email.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath) as! EmailCell
        
        cell.contentsTitle.text = email[indexPath.row]
        
        if isExpand[indexPath.row] == false {
            cell.contentsTitle.numberOfLines = 2
        } else {
            cell.contentsTitle.numberOfLines = 0
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isExpand[indexPath.row] == false {
            isExpand[indexPath.row] = true
        } else {
            isExpand[indexPath.row] = false
        }
        
        self.emailTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
}
