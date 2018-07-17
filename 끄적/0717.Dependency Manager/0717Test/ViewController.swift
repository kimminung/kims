//
//  ViewController.swift
//  0717Test
//
//  Created by 김민웅 on 2018. 7. 17..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import UIKit
import Colorify
import Alamofire
import Kingfisher



class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addGradient(from: Colorify.Blue, to: Colorify.Orange, direction: .topLeftBottomRight)
        
        let imageUrl = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg")!
        
        Alamofire.request(imageUrl)
            .validate()
            .responseData{[weak self] response in
                switch response.result {
                case.success(let value):
                    self?.imageView.image = UIImage(data: value)
                case.failure(let error):
                    print(error)
                }
        }
        
        imageView.kf.setImage(with: imageUrl)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

