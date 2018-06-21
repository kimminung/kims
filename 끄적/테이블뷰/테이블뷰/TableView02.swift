//
//  TableView02.swift
//  테이블뷰
//
//  Created by 김민웅 on 19/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class TableView02: UIViewController {
    
    let data = Array(1...48)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("--------테이블 뷰2가 로드되었다-------")
        // Do any additional setup after loading the view.
        
        let tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        print("--------테이블 뷰2가 하위 레이아웃을 볼것이다-------")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("---------테이블 뷰2가 나타났다-------")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("--------테이블 뷰2가 사라졌다--------")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("--------테이블 뷰2가 사라질것이다------")
    }
}

extension TableView02: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        print((data.count / 10) + 1)
        return (data.count / 10) + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section != (data.count / 10) {
            return data[(section * 10)..<(section + 1) * 10].count
        }else{
            return data[(section * 10)...].count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "\(indexPath.section * 10 + data[indexPath.row])"
        return cell
    }
    
}
