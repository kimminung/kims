//
//  ViewController.swift
//  BasicFileSystem
//
//  Created by giftbot on 2018. 7. 2..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private var names: [String] = []
    private var names2: [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //    printPath()
        //    bundleData()
        //    propertyListSerialization()
        groupData()
    }
    
    private func printPath() {
        print("\n---------- [ Print Path ] ----------\n")
        
        // 번들 디렉토리
        let bundlePath = Bundle.main.bundlePath
        print("[ Bundle ]\n", bundlePath, "\n")
        
        //바탕화면에서 커멘드 + 쉬프트 + G 누르고 경로 이동해보면 파일 뜸
        /*
         [ Bundle ]
         /Users/gimmin-ung/Library/Developer/CoreSimulator/Devices/0BD132A8-4CC5-43BA-B9A8-359DE2CD0820/data/Containers/Bundle/Application/3B09AA11-3BF5-46D4-9DDF-965DA936013C/BasicFileSystem.app
         */
        
        // 데이터 컨테이너 홈 디렉토리
        let homePath = NSHomeDirectory()
        print("[ Home ]\n", homePath, "\n")
        /*
         [ Home ]
         /Users/gimmin-ung/Library/Developer/CoreSimulator/Devices/0BD132A8-4CC5-43BA-B9A8-359DE2CD0820/data/Containers/Data/Application/D6BC8FD5-646D-4117-9C42-9CE5F822AC5A
         */
        
        // 도큐먼트 폴더 경로
        //일반적
        let documentPath1 = NSHomeDirectory() + "/Documents"
        //스트링으로 사용
        let documentPath2 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //url로 사용
        let documentPath3 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]   //싱글톤
        print("[ Document ]")
        print(documentPath1)
        print(documentPath2)
        print(documentPath3)
        
        print("\n---------- [ Diff ] ----------\n")
        
        // expandTilde Bool 값 차이
        //1번처럼 사용해줘야 ios가 제대로 인식함
        let libraryPath1 = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        //2번은 경로를 축약시켜 보여줌으로 ios에서 제대로 확인을 못함
        let libraryPath2 = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, false)
        print(libraryPath1)
        print(libraryPath2)
        print("==\n")
        
        // domainMask 차이 (allDomainMask 의 경우 macOS 의 디렉토리 등이 포함됨)
        let cachesDirectory1 = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cachesDirectory2 = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .allDomainsMask, true)
        print(cachesDirectory1)
        print(cachesDirectory2)
        print("==\n")
        
        // ApplicationSupport, tmp 디렉토리
        let applicationSupport = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let temporary = NSTemporaryDirectory()
        print(applicationSupport)
        print(temporary)
        print("==\n")
    }
    
    
    
    private func groupData() {
        print("\n-------[Group]-------\n")
        guard let path = Bundle.main.path(forResource: "boyGirl", ofType: "plist"),
            let content = NSDictionary(contentsOfFile: path) as? [String: [String]]
            else{ return }
        print(type(of: content))
        print(content)
        print("Group:", path)
        names2 = content
        print(names2)
        
        for boy in content["Boy"]! {
            print(boy)
        }
        for girl in content["Girl"]! {
            print(girl)
        }
    }
    
    private func bundleData() {
        print("\n---------- [ BundleData ] ----------\n")
        guard let path = Bundle.main.path(forResource: "idols", ofType: "plist"),
            let content = NSArray(contentsOfFile: path) as? [String]
            else { return }   //실패하면 그냥 빨리 종료시켜버림
        print("Bundle Resource Path :", path)
        names = content
        print(names)
        
        
        print("\n---------- [ Copy to Documents Directory ] ----------\n")
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //    let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destPath = documentPath + "/copied.plist"
        print("document path :", documentPath)
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: destPath) {
            do {
                try fileManager.copyItem(atPath: path, toPath: destPath)
                print("도큐먼트 폴더에 파일 복사 완료")
            } catch let error {
                print("파일 복사 에러 :", error.localizedDescription)
            }
        }
        
        // 도큐먼트 폴더 내 파일 목록 출력
        if let files = try? fileManager.contentsOfDirectory(atPath: documentPath) {
            print("\(files.count) Files in Documents : \(files)")
        }
        
        print("\n---------- [ Load & Change Data ] ----------\n")
        
        // copied.plist 에 저장된 내용을 가져와서 fileData 에 저장
        guard var fileData = NSArray(contentsOfFile: destPath) as? [String] else { return }
        
        // idols bundle - 읽기 전용
        // copied.plist - 읽기 쓰기가 가능한 파일
        
        let newData = "마마무"
        if !fileData.contains(newData) {
            // 복사한 파일에 추가 데이터 삽입
            fileData.append(newData)
            (fileData as NSArray).write(toFile: destPath, atomically: true)
        }
        
        if let newContents = NSArray(contentsOfFile: destPath) as? [String] {
            names = newContents
            print(newContents)
        }
    }
    
    private func propertyListSerialization() {
        print("\n---------- [ propertyListSerialization ] ----------\n")
        guard let path = Bundle.main.path(forResource: "idols", ofType: "plist"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path))
            else { return }
        
        if var list = try? PropertyListSerialization.propertyList(from: data, format: nil) as! [String] {
            list.append("마마무")
            
            let newList = try! PropertyListSerialization.data(fromPropertyList: list, format: .xml, options: 0)
            let url = URL(fileURLWithPath: path)
            try! newList.write(to: url)
            print("url :", url)
        }
        
        // 잘 들어갔는지 확인
        guard let newData = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
        if let newList = try? PropertyListSerialization.propertyList(from: newData, format: nil) as! [String] {
            print(newList)
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return names2.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return names2["Girl"]!.count
        } else {
            return names2["Boy"]!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdolCell", for: indexPath)
        
        if indexPath.section == 0 {
//            cell.textLabel?.text = names2["Girl"]![indexPath.row]
            let cellData = names2["Girl"]!
            let string = cellData[indexPath.row]
            cell.textLabel?.text = string
        } else {
            let cellData = names2["Boy"]!
            let string = cellData[indexPath.row]
            cell.textLabel?.text = string
        }
        
        return cell
    }
}

