//
//  PlayerCardCollectionViewCell.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/4/21.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class PlayerCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    
     
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code   
        
//        self.playerImage.layer.cornerRadius = 100
//        self.playerImage.layer.masksToBounds = true
        
     
    }

}
