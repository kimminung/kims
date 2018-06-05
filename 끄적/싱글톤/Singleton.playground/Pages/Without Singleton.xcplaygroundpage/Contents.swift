//: [Previous](@previous)

import Foundation
import UIKit

final class User {
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

final class Friends {
  let name: String
  init(name: String) { self.name = name }
}

final class FriendListViewController: UIViewController {
  let user: User
  init(user: User) {
    self.user = user
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addFriend() {
    let 원빈 = Friends(name: "원빈")
    let 현빈 = Friends(name: "현빈")
    user.friends.append(원빈)
    user.friends.append(현빈)
  }
}

final class BlockListViewController: UIViewController {
  let user: User
  init(user: User) {
    self.user = user
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func blockFriend() {
    let friend = Friends(name: "현빈")
    if let index = user.friends.index(where: { $0.name == friend.name }) {
      user.friends.remove(at: index)
    }
    if !user.blocks.contains(where: { $0.name == friend.name }) {
      user.blocks.append(friend)
    }
  }
}

let user = User()

let friendListVC = FriendListViewController(user: user)
friendListVC.addFriend()
user.friends

let blockListVC = BlockListViewController(user: user)
blockListVC.blockFriend()
user.friends
user.blocks


//: [Next](@next)
