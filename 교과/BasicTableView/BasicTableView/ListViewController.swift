//
//  ListViewController.swift
//  BasicTableView
//
//  Created by giftbot on 2018. 6. 19..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
  let viewControllers: [UIViewController] = [TableView01(), TableView02(), TableView03()]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}


// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewControllers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
    cell.textLabel?.text = "\(viewControllers[indexPath.row])"
    return cell
  }
}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = viewControllers[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }
}

