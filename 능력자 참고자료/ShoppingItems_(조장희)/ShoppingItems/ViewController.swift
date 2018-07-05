//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2018. 6. 20..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit



final class ViewController: UIViewController {
  
    @IBOutlet private weak var tableView: UITableView!
  
    let itemArray: [appleItemData] = [.iPhoneX_SpaceGray, .iPhoneX_White, .iPhoneSE_RoseGold, .iPhone8, .iPhoneSE_Gold]
    var stockData: [String: Int] = [:]
    
//    var stock: Int = 0
//    var count: Int = 0 {
//        didSet {
//
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section \(section)"
    }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
//    stockData[indexPath.section].insert(Int(count), at: indexPath.row)
    
    print(indexPath.section, "\n")
    print(stockData)
    
    let name = itemArray[indexPath.row].itemName
    cell.itemImage?.image = UIImage(named: name)
    cell.titleLabel.text = name
    cell.delegate = self
    return cell
  }
}


// Mark: - ItemCellDelegate

extension ViewController: ItemCellDelegate {
    func itemCount(_ itemCell: ItemCell, button: UIButton) {
//        if stock >= 5 {
//            itemCell.backgroundColor = .red
//            let alertController = UIAlertController(title: nil, message: "재고가 없습니다", preferredStyle: .alert)
//            let alertOk = UIAlertAction(title: "Ok", style: .default){ (_) in
//                itemCell.backgroundColor = UIColor.white
//                itemCell.orderAmoutLabel.text = "\(self.stock)"
//            }
//            let alertCancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
//                itemCell.orderAmoutLabel.text = "0"
//                self.stock = 0
//                itemCell.backgroundColor = UIColor.cyan
//            }
//            for alert in [alertOk, alertCancel] { alertController.addAction(alert) }
//            present(alertController, animated: true)
//        } else {
//            count = 1
//            stock += count
//            count = 0
//            itemCell.orderAmoutLabel.text = "\(stock)"
//
//            stockData = [itemCell.titleLabel.text! : stock]
//        }
        
    }
}

