//
//  PasswordTableViewCell.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/4/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class PasswordTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate:passwordCellDelegate?
    var data:labelCellDelegate?
    var textFieldType:TextFieldType?
    
    @IBOutlet weak var bottomLineView: UIView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var buttonInCell: UIButton!
    @IBOutlet weak var textFieldInCell: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        textFieldInCell.delegate = self
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func forgetPasswordAction(sender: UIButton) {
        self.delegate?.getToDestinationController()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let enteredText = self.textFieldInCell.text
        self.data?.getText(self.textFieldType!, enterText: enteredText!)
        self.textFieldInCell.endEditing(true)
        return false
    }
    
    @IBAction func textEditingChange(sender: UITextField) {
        let enteredText = self.textFieldInCell.text
        self.data?.getText(self.textFieldType!, enterText: enteredText!)
    }
}
