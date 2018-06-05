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
    func addFriend() {
        let 원빈 = Friends(name: "원빈")
        let 현빈 = Friends(name: "현빈")
        User.shared.friends.append(원빈)
        User.shared.friends.append(현빈)
        
        //            let user = User.init()                // private init() {}주석처리해야 돌아감
        //            user.friends.append(원빈)              // private init() {}주석처리해야 돌아감
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
        
        //            let user = User.init()                // private init() {}주석처리해야 돌아감
        //            user.blocks.append(현빈)     //에러         // private init() {}주석처리해야 돌아감
    }
}

let user = User()

let friendListVC = FriendListViewController(user: User)
friendListVC.addFriend()
User.shared.friends

let blockListVC = BlockListViewController(user: Usewr)
blockListVC.blockFriend()
User.shared.friends
User.shared.blocks


//싱글톤 사용하지 않고 동일하게 출력해보기

//: [Next](@next)
