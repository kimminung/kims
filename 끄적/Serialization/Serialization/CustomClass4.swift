//
//  CustomClass4.swift
//  Serialization
//
//  Created by giftbot on 2018. 3. 9..
//  Copyright © 2018년 Giftbot. All rights reserved.
//

import Foundation

struct CustomClass4: Codable, CustomStringConvertible {
//final class CustomClass4: Codable, CustomStringConvertible {
  let name: String
  let job: String
  
  init(name: String, job: String) {
    self.name = name
    self.job = job
  }
  
  var description: String {
    return name + " : " + job
  }
  
  // MARK: Encode & Decode Helper

  func encoded() {
    do {
      let classData = try JSONEncoder().encode(self)
      try classData.write(to: CustomClass4.encodingPath())
    } catch {
      print("Encoding data has failed with error: ", error.localizedDescription)
    }
  }

  static func decode() -> CustomClass4 {
    do {
      let data = try Data(contentsOf: encodingPath())
      let decodedClass = try JSONDecoder().decode(CustomClass4.self, from: data)
      return decodedClass
    } catch {
      print("Decoding data has failed with error: ", error.localizedDescription)
      return CustomClass4(name: "giftbot", job: "iOS Developer")
    }
  }

  static func encodingPath() -> URL {
    let caches = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let path = caches.appendingPathComponent("codableData.dat")
    return path
  }
}
