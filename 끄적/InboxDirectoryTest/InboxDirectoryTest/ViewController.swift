//
//  ViewController.swift
//  InboxDirectoryTest
//
//  Created by giftbot on 2018. 2. 27..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let fileManager = FileManager.default
  @IBOutlet weak var docuInboxTableView: UITableView!
  @IBOutlet weak var tmpInboxTableView: UITableView!
  
  var docuInboxFiles: [String] {
    let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/Inbox"
    if let contents = try? fileManager.contentsOfDirectory(atPath: dir) {
      print("docuContents :", contents)
      return contents
    }
    return []
  }
  var tmpInboxFiles: [String] {
    let dir = NSTemporaryDirectory() + "\(Bundle.main.bundleIdentifier!)-Inbox"
    print(dir)
    if let contents = try? fileManager.contentsOfDirectory(atPath: dir) {
      print("tmpContents :", contents)
      return contents
    }
    return []
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    docuInboxTableView.reloadData()
    tmpInboxTableView.reloadData()
  }

  
  private func documentsPath() {
    let docu = NSHomeDirectory() + "/Documents"
    let docuInbox = NSHomeDirectory() + "/Documents/Inbox"
    if let contents = try? fileManager.contentsOfDirectory(atPath: docu) {
      print("Documents : ", contents)
    }
    if let contents = try? fileManager.contentsOfDirectory(atPath: docuInbox) {
      print("Documents/Inbox : ", contents)
      //      print("path :", docu + "/Inbox/" + contents.first!)
      //      try? fileManager.removeItem(atPath: docu + "/Inbox/" + contents.first!)
    }
  }
  
  private func tmpPath() {
    // 주의할 점. NSTemporaryDirectory() 는 끝에 / 까지 들어감.  "tmp/"
    let temp = NSTemporaryDirectory()
    let tempInbox = NSTemporaryDirectory() + "\(Bundle.main.bundleIdentifier!)-Inbox"
    if let contents = try? fileManager.contentsOfDirectory(atPath: temp) {
      print(contents)
    }
    if let contents = try? fileManager.contentsOfDirectory(atPath: tempInbox) {
      print(contents)
    }
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == docuInboxTableView {
      return docuInboxFiles.count
    } else {
      return tmpInboxFiles.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if tableView == docuInboxTableView {
      cell = tableView.dequeueReusableCell(withIdentifier: "docuCell", for: indexPath)
      cell.textLabel?.text = docuInboxFiles[indexPath.row]
    } else {
      cell = tableView.dequeueReusableCell(withIdentifier: "tmpCell", for: indexPath)
      cell.textLabel?.text = tmpInboxFiles[indexPath.row]
    }
    return cell
  }
}



