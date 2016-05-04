//
//  AddTeamLabelTableViewCell.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/5/1.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class AddTeamLabelTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var addTeamDetailText: UITextField!
    @IBOutlet weak var addTeamDetailIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addTeamDetailText.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.addTeamDetailText.endEditing(true)
        return false
    }

    
}
