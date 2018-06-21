//
//  TableView01.swift
//  테이블뷰
//
//  Created by 김민웅 on 19/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class TableView01: UIViewController {
    
    let data = Array(1...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("--------테이블 뷰1이 로드되었다-------")
        
        let tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        view.addSubview(tableView)
        
        //    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    override func viewWillLayoutSubviews() {
        print("--------테이블 뷰1이 하위 레이아웃을 볼것이다-------")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("---------테이블 뷰1이 나타났다-------")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("--------테이블 뷰1이 사라졌다--------")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("--------테이블 뷰1이 사라질것이다------")
    }
    
}

extension TableView01: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cellId") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        }
        
        //    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}
