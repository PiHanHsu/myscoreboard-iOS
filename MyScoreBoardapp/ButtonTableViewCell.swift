//
//  ButtonTableViewCell.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/2/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit


class ButtonTableViewCell: UITableViewCell {
    
    var delegate:buttonCellDelegate?
    var type:ButtonType?
    @IBOutlet weak var buttonInCell: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cellClickAction(sender: AnyObject) {
        self.delegate?.buttonClick(self.type!)
    }
    
}
