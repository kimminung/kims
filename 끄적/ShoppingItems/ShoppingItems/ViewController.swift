//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2018. 6. 20..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView!
  
  private let itemManager = ItemManager()
  private var items: [ShoppingItem] = []
  private var orderItems: [String: Int] = [:]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    items = itemManager.items
    tableView.rowHeight = 80
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
    cell.delegate = self
    cell.setupCell(title: items[indexPath.row].title, imageName: items[indexPath.row].imageName)
    cell.orderAmount = orderItems[cell.title] ?? 0
    return cell
  }
}


 // MARK: - ItemCellDelegate

extension ViewController: ItemCellDelegate {
  func itemCell(_ itemCell: ItemCell, didTapAddButton: UIButton) {
    guard itemManager.checkOrderAvailability(title: itemCell.title, orderAmount: itemCell.orderAmount)
      else {
        itemCell.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        UIView.animate(withDuration: 1, animations: { [weak itemCell] in
          itemCell?.backgroundColor = .white
        })
        print("재고가 부족합니다.")
        return
    }
    itemCell.orderAmount += 1
    orderItems[itemCell.title] = itemCell.orderAmount
  }
}
