//
//  CustomCell.swift
//  TableViewCellLifeCycle
//
//  Created by giftbot on 2018. 6. 20..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    //최초 초기화는 원래 required...init인데 스토리보드에서 뷰디드로드 비슷한 역할로
    //xib, nib 이런것씀
    
    /*
     init(){
     super.init(style: <#T##UITableViewCellStyle#>, reuseIdentifier: <#T##String?#>)
     }
     override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
     super.init(style: <#T##UITableViewCellStyle#>, reuseIdentifier: <#T##String?#>)
     //setup
     }
     
     required init?(coder aDecoder: NSCoder) {
     super.init(coder: <#T##NSCoder#>)
     }
     */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("\n---------- [ awakeFromNib ] ----------\n")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("\n---------- [ prepareForReuse ] ----------\n")
    }
    
    deinit {
        print("\n---------- [ deinit ] ----------\n")
    }
}
