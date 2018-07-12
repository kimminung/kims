//
//  ViewController.swift
//  개인플레이
//
//  Created by 김민웅 on 2018. 6. 26..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let tableView = UITableView()
    private let tableViewCell = UITableViewCell()
    private let imageView = UIImageView()
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.backgroundColor = .blue
        tableView.backgroundColor = .black
        tableViewCell.backgroundColor = .white
        label.backgroundColor = .red
        label.textColor = .green
        
        view.addSubview(scrollView)
        view.addSubview(tableView)
        view.addSubview(tableViewCell)
        view.addSubview(label)
        view.addSubview(imageView)
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let margin: CGFloat = 20
        let safeLayoutInsets = view.safeAreaInsets
        let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right
        
        let yOffset = safeLayoutInsets.top + margin
        let viewWidth = (view.bounds.maxX)
        
        scrollView.frame = CGRect(x: safeLayoutInsets.left, y: yOffset, width: viewWidth - margin - 5, height: view.bounds.height - safeLayoutInsets.top - margin - yOffset)
        
        tableView.frame = CGRect(x: 0, y:Int(view.bounds.midY), width: Int(viewWidth), height: 50)
    }
    
    
}

