//
//  TableView02.swift
//  BasicTableView
//
//  Created by giftbot on 2018. 6. 19..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class TableView02: UIViewController {
  
  let data = Array(1...48)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    view.addSubview(tableView)
  }
}

// MARK: - UITableViewDataSource

extension TableView02: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return (data.count / 10) + 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section != (data.count / 10) {
      return data[(section * 10)..<(section + 1) * 10].count
    } else {
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
