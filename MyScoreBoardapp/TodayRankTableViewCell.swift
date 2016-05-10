//
//  TodayRankTableViewCell.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/9/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class TodayRankTableViewCell: UITableViewCell {

    @IBOutlet weak var redTeamScore: UILabel!
    @IBOutlet weak var blueTeamScore: UILabel!
    @IBOutlet weak var redTeamPlayerOne: UILabel!
    @IBOutlet weak var redTeamPlayerTwo: UILabel!
    @IBOutlet weak var blueTeamPlayerOne: UILabel!
    @IBOutlet weak var blueTeamPlayerTwo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // clear label
        self.clearLabels()
        
    }
    
    func clearLabels() {
        self.redTeamScore.text = "0"
        self.redTeamScore.textColor = UIColor(red: CGFloat(82)/255, green: CGFloat(142)/255, blue: CGFloat(233)/255, alpha: CGFloat(1))
        self.blueTeamScore.text = "0"
        self.blueTeamScore.textColor = UIColor(red: CGFloat(82)/255, green: CGFloat(142)/255, blue: CGFloat(233)/255, alpha: CGFloat(1))
        self.redTeamPlayerOne.text = ""
        self.redTeamPlayerOne.textColor = UIColor.lightGrayColor()
        self.redTeamPlayerTwo.text = ""
        self.redTeamPlayerTwo.textColor = UIColor.lightGrayColor()
        self.blueTeamPlayerOne.text = ""
        self.blueTeamPlayerOne.textColor = UIColor.lightGrayColor()
        self.blueTeamPlayerTwo.text = ""
        self.blueTeamPlayerTwo.textColor = UIColor.lightGrayColor()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
