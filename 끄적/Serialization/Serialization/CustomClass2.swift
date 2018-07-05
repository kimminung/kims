//
//  CustomClass2.swift
//  Serialization
//
//  Created by giftbot on 2018. 1. 21..
//  Copyright © 2018년 Giftbot. All rights reserved.
//

import Foundation

final class CustomClass2: NSObject, NSCoding {
  let name: String
  let job: String
  
  init(name: String, job: String) {
    self.name = name
    self.job = job
  }

  init(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(forKey: "name") as! String
    job = aDecoder.decodeObject(forKey: "job") as! String
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(job, forKey: "job")
  }
  
  override var description: String {
    return name + " : " + job
  }
}


