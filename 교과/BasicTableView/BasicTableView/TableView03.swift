//
//  TableView03.swift
//  BasicTableView
//
//  Created by giftbot on 2018. 6. 19..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class TableView03: UIViewController {
  
  let animals = [
    "bear", "buffalo", "camel", "dog", "elephant",
    "koala", "llama", "panda", "lion", "horse",
    "guinea_pig", "koala", "whale_shark", "whale", "duck",
    "seagull", "black_swan", "peacock", "giraffe"
  ]
  var checked: Array<Bool> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    checked = Array<Bool>(repeating: false, count: animals.count)
    
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    view.addSubview(tableView)
  }
}


extension TableView03: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let animal = animals[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
    cell.textLabel?.text = animal
    cell.imageView?.image = UIImage(named: animal)
//    cell.accessoryType = checked[indexPath.row] ? .checkmark : .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}


extension TableView03: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath) else { return }
    
    if cell.accessoryType == .checkmark {
      cell.accessoryType = .none
    } else {
      cell.accessoryType = .checkmark
    }
//    checked[indexPath.row] = !checked[indexPath.row]
  }
}
