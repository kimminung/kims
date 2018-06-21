//
//  ViewController.swift
//  BasicTableView
//
//  Created by giftbot on 2018. 6. 19..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class TableView01: UIViewController {
  
  let data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    view.addSubview(tableView)
    
//    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
  }
}

// MARK: - UITableViewDataSource

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
