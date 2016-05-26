//
//  RankingTableViewCell.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/9/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var RankNumberLabel: UILabel!
    
    @IBOutlet weak private var winRateLabel: UILabel!
    @IBOutlet weak private var points: UILabel!
    
    var winRate:CGFloat = CGFloat(100) {
        didSet {
            self.winRateLabel.text = "勝率 ：\(self.winRate)% (勝 \(self.winCount) 敗 \(self.loseCount))"
        }
    }
    
    var winCount:Int = 0 {
        didSet {
            self.winRateLabel.text = "勝率 ：\(self.winRate)% (勝 \(self.winCount) 敗 \(self.loseCount))"
        }
    }
    
    var loseCount:Int = 0 {
        didSet {
            self.winRateLabel.text = "勝率 ：\(self.winRate)% (勝 \(self.winCount) 敗 \(self.loseCount))"
        }
    }
    
    var pointsAccumulation:Int = 0 {
        didSet {
            self.points.text = "積分 ：\(self.pointsAccumulation)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func drawRect(rect: CGRect) {
        self.playerImage.layer.cornerRadius = self.playerImage.layer.bounds.width / 2
        self.playerImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
