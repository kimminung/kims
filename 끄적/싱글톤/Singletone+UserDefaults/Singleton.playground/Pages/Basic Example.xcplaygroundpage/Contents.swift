//: [Previous](@previous)

import Foundation
import UIKit


final class User {
  static let shared = User()
  private init() {}
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

final class Friends {
  let name: String
  init(name: String) { self.name = name }
}

final class FriendListViewController: UIViewController {
  func addFriend() {
    let 원빈 = Friends(name: "원빈")
    let 현빈 = Friends(name: "현빈")
    User.shared.friends.append(원빈)
    User.shared.friends.append(현빈)
  }
}

final class BlockListViewController: UIViewController {
  func blockFriend() {
    let friend = Friends(name: "현빈")
    if let index = User.shared.friends.index(where: { $0.name == friend.name }) {
      User.shared.friends.remove(at: index)
    }
    if !User.shared.blocks.contains(where: { $0.name == friend.name }) {
      User.shared.blocks.append(friend)
    }
  }
}



let friendListVC = FriendListViewController()
friendListVC.addFriend()
User.shared.friends

let blockListVC = BlockListViewController()
blockListVC.blockFriend()
User.shared.friends
User.shared.blocks



//: [Next](@next)
