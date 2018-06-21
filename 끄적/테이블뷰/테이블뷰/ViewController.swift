//
//  ViewController.swift
//  테이블뷰
//
//  Created by 김민웅 on 19/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*
    @IBOutlet private weak var tableView:UITableView!
    let data = Array(1...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
}

//  MARK : - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)    //반환타입이 옵션이 아닌거라서 스토리보드를 사용
        
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        //걍 사용
        
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cellId"){
            cell = reusableCell
        }else{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        }
        
        cell.textLabel?.text = "\(data[indexPath.row])"
        
        return cell
    }*/
}
