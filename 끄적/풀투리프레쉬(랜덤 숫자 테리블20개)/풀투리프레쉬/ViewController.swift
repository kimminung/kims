//
//  ViewController.swift
//  풀투리프레쉬
//
//  Created by 김민웅 on 21/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //테이블 뷰와 숫자배열 데이터
    private var tableView = UITableView()
    private var data: [Int] = Array(1...20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupTableView()
        
//        navigationItem.rightBarButtonItems //여러개 일때
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(changeEditMode))
    }
    
    @objc func changeEditMode() {
        print("edit")
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    //특정한곳에 안나오게 하고싶을 때
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    
    //
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row % 3 == 0 {
            return .delete
        }else if indexPath.row % 3 == 1{
            return .insert
        }else{
        return .none
    }
    }
    
//    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//        <#code#>
//    }
//    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    
//    11버젼
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let addAction = UIContextualAction(style: .normal
//        /* .destructive */, title: "add"){(action, view, sucess) in
//
//        }
//    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            print("insert")
        case .delete:
            print("delete")
        case .none:
            break
        }
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl.tintColor = .blue
        tableView.refreshControl = refreshControl
        
        //
        //
        //
    }
    
    @objc func reloadData() {
        var selectedNumbers: [Int] = []
        if let selectedRows = tableView.indexPathsForSelectedRows{
            selectedNumbers = selectedRows.map{return data[$0.row]}
        }
        data = selectedNumbers
        let maxCount = 20
        for _ in 1...(maxCount - selectedNumbers.count) {
            generateRandomeNumber()
        }
        //        data.removeAll(keepingCapacity: true)
        //        for _ in 1...20 {
        //            generateRandomeNumber()
        //        }
        
        if tableView.refreshControl!.isRefreshing{
            tableView.refreshControl?.endRefreshing()
        }
        tableView.reloadData()
    }
    
    //재귀함수 사용
    func generateRandomeNumber() {
        let randomNumber = Int(arc4random_uniform(50))
        //같은값 처리
        guard !data.contains(randomNumber) else { return generateRandomeNumber() }
        data.append(randomNumber)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cellId"){
            cell = reusableCell
        }else{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellInd")
        }
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}


