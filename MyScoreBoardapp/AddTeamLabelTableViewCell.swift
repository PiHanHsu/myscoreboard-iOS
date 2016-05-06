//
//  AddTeamLabelTableViewCell.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/5/1.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class AddTeamLabelTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var bottomLineView: UIView!
    var delegate:labelCellDelegate?
    var textFieldType:TextFieldType?
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
        let enteredText = self.addTeamDetailText.text
        self.delegate?.getText(self.textFieldType!, enterText: enteredText!)
        self.addTeamDetailText.endEditing(true)
        return false
    }

    @IBAction func textEditingChange(sender: UITextField) {
        let enteredText = self.addTeamDetailText.text
        self.delegate?.getText(self.textFieldType!, enterText: enteredText!)
        
        switch self.textFieldType! {
        case .Gender, .ChoseTeam, .GameMode:
            print(self.addTeamDetailText.resignFirstResponder())
        default:
            break
        }
    }
    
    @IBAction func selectedTextFieldAction(sender: UITextField) {
        var pickerContent:[String] = []
        
        switch self.textFieldType! {
        case .Gender:
            pickerContent = ["男","女"]
            self.delegate?.callPicker(self, pickerContent: pickerContent)
            self.addTeamDetailText.resignFirstResponder()
        case .ChoseTeam:
            pickerContent = ["世界大賽冠軍","AlphaCamp8"]
            self.delegate?.callPicker(self, pickerContent: pickerContent)
            self.addTeamDetailText.resignFirstResponder()
        case .GameMode:
            pickerContent = ["手動排賽","自動排賽"]
            self.delegate?.callPicker(self, pickerContent: pickerContent)
            self.addTeamDetailText.resignFirstResponder()
        default:
            pickerContent = []
        }
    }
    
}
