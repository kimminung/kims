//
//  ListViewController.swift
//  테이블뷰
//
//  Created by 김민웅 on 19/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    let viewControllers: [UIViewController] = [TableView01(), TableView02(), TableView03()]
//    let friendNames: [String] = ["sejun", "minwoong"]
    
        override func viewDidLoad() {
            super.viewDidLoad()
            print("--------뷰가 로드되었다-------")
    
    //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    //        // Do any additional setup after loading the view.
        }
    
    override func viewWillLayoutSubviews() {
        print("--------뷰가 하위 레이아웃을 볼것이다-------")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("---------뷰가 나타났다-------")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("--------뷰가 사라졌다--------")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("--------뷰가 사라질것이다------")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("\n---------- [ awakeFromNib ] ----------\n")
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        print("\n---------- [ prepareForReuse ] ----------\n")
//    }
    
    deinit {
        print("\n---------- [ deinit ] ----------\n")
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt : \(indexPath.row)")
        //아래 부분을 안쓰면 view didLoad에
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")을 추가함
        //이 부분
        /*
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "list"){
        cell = reusableCell
        }else{
        cell = UITableViewCell(style: .default, reuseIdentifier: "list")
        }
         */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        cell.textLabel?.text = "\(viewControllers[indexPath.row])"
        return cell
    }
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = viewControllers[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

