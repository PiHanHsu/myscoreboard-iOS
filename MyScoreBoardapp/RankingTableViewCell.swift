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

    
//    var winRateString:String {
//        get {
//            return "勝率 ：\(winRate)% (勝 \(winCount) 敗 \(loseCount))"
//        }
//        set {
//            self.winRateLabel.text = winRateString
//        }
//    }
//
//    var pointsAccumulationString:String {
//        get {
//            return "積分 ：\(pointsAccumulation)"
//        }
//        set {
//            self.points.text = pointsAccumulationString
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //self.playerImage.layer.cornerRadius = self.playerImage.layer.bounds.width / 2
        //self.playerImage.clipsToBounds = true
        //self.playerImage.layer.masksToBounds = true
        
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
