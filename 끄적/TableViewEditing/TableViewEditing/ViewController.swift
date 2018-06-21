//
//  ViewController.swift
//  TableViewEditing
//
//  Created by giftbot on 2018. 6. 21..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  // MARK: Properties
  
  private var tableView = UITableView()
  private var data: [Int] = Array(1...20)
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Edit", style: .plain, target: self, action: #selector(switchToEditing)
    )
  }
  
  // MARK: Setup
  
  func setupTableView() {
    tableView.frame = view.frame
    tableView.delegate = self
    tableView.dataSource = self
    tableView.allowsMultipleSelection = true
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
    let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshControl.tintColor = .blue
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  // MARK: Action Handler
  
  @objc func reloadData() {
    var selectedNumbers: [Int] = []
    if let selectedRows = tableView.indexPathsForSelectedRows {
      selectedNumbers = selectedRows.map { return data[$0.row] }
    }
    data = selectedNumbers
    
    let maxCount = 20
    for _ in 1...(maxCount - selectedNumbers.count) {
      generateRandomNumber()
    }
    
    if tableView.refreshControl!.isRefreshing {
      tableView.refreshControl?.endRefreshing()
    }
    tableView.reloadData()
  }
  
  @objc func switchToEditing() {
    tableView.setEditing(!tableView.isEditing, animated: true)
  }
  
  private func generateRandomNumber() {
    let randomNumber = Int(arc4random_uniform(50))
    guard !data.contains(randomNumber) else { return generateRandomNumber() }
    data.append(randomNumber)
  }
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    guard data[indexPath.row] > 10 else { return nil }
    return indexPath
  }
  
  
  // Default - true
//  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//    return true
//  }
  
//  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//    switch editingStyle {
//    case .none: print("none")
//    case .insert:
//      print("insert")
//      data.insert(Int(arc4random_uniform(50)), at: indexPath.row)
//      tableView.insertRows(at: [indexPath], with: .top)
//    case .delete:
//      print("delete")
//      data.remove(at: data.index(of: data[indexPath.row])!)
//      tableView.deleteRows(at: [indexPath], with: .bottom)
//    }
//  }
  
//  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//    return .insert
//  }
  
//  func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//    return false
//  }
  
  

  /***************************************************
   iOS 8
   leadingSwipeActionsConfigurationForRowAt 또는
   trailingSwipeActionsConfigurationForRowAt 메서드가 정의되어 있을 경우 무시
   정의되어 있지 않을 경우 호출됨
   ***************************************************/
  
//  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//    print("\n---------- [ editActionsForRowAt ] ----------\n")
//    let addAction = UITableViewRowAction(style: .default, title: "Add") { (action, indexPath) in
//      print("Add")
//    }
//    let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
//      print("Delete")
//    }
//    return [addAction, deleteAction]
//  }

  
  /***************************************************
   iOS 11부터 가능
   ***************************************************/

//  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//    print("\n---------- [ trailingSwipeActionsConfigurationForRowAt ] ----------\n")
//    let addAction = UIContextualAction(style: .normal, title: "Add") { (action, view, success) in
//      print("Add Action Tapped")
//      success(true)
//    }
//    addAction.backgroundColor = .green
//    let configuration = UISwipeActionsConfiguration(actions: [addAction])
//    configuration.performsFirstActionWithFullSwipe = true  // default
//    return configuration
//  }
//
  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    print("\n---------- [ leadingSwipeActionsConfigurationForRowAt ] ----------\n")
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, success) in
      print("delete")
      success(true)
    }
    deleteAction.backgroundColor = .red
    return UISwipeActionsConfiguration(actions: [deleteAction])
  }
}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
}
