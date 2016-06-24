//
//  ShowTeamMemberTableViewCell.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/6/24.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class ShowTeamMemberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MemberImage: UIImageView!
    @IBOutlet weak var MemberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
