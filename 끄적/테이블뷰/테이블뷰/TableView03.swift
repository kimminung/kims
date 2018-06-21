//
//  TableView03.swift
//  테이블뷰
//
//  Created by 김민웅 on 19/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class TableView03: UIViewController {
    
    let animals = [ "bear", "buffalo", "camel", "dog", "elephant","koala", "llama", "panda", "lion", "horse","guinea_pig", "koala", "whale_shark", "whale", "duck","seagull", "black_swan", "peacock", "giraffe" ]
    var checked: Array<Bool> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("--------테이블 뷰3이 로드되었다-------")
        
        // Do any additional setup after loading the view.
        checked = Array<Bool>(repeating: false, count: animals.count)
        
        let tableView = UITableView(frame:view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        print("--------테이블 뷰3이 하위 레이아웃을 볼것이다-------")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("---------테이블 뷰3이 나타났다-------")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("--------테이블 뷰3이 사라졌다--------")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("--------테이블 뷰3이 사라질것이다------")
    }
}


extension TableView03: UITableViewDataSource {
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animal = animals[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = animal
        cell.imageView?.image = UIImage(named:animal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension TableView03: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard var cell = tableView.cellForRow(at: indexPath)
            
            else {return}
        //var bg = cell.backgroundColor
        //var tx = cell.textLabel?.textColor
        //print(animals[indexPath.row])
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
            cell.textLabel?.textColor = .black
        }else{
            cell.textLabel?.textColor = .red
            cell.textLabel?.backgroundColor = . blue
            //bg = .orange
            //tx = .purple
            print(animals[indexPath.row])
            cell.accessoryType = .checkmark
            
        }
    }
}

