//
//  RegisterAccountTableViewController.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/4/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class RegisterAccountTableViewController: BasicTableViewController,labelCellDelegate, buttonCellDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet var pickerBackgroundView: UIView!
    
    var numberOfPicker = 0
    var numberOfComponentsInPicker = 0
    var pickerContent:[String] = []
    let numberOfRowInSection = [1,3,1,1,1]
    var blackBackGround = UIView()
    var gender = AddTeamLabelTableViewCell()
    var selectedGender = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        self.cancelButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.uploadImage.layer.cornerRadius = self.uploadImage.bounds.width / 2
        self.uploadImage.clipsToBounds = true
        
        // cell register
        let buttonCellNib = UINib(nibName: "ButtonTableViewCell", bundle: nil)
        let labelCellNib = UINib(nibName: "AddTeamLabelTableViewCell", bundle: nil)
        
        self.tableView.registerNib(buttonCellNib, forCellReuseIdentifier: "buttonCell")
        self.tableView.registerNib(labelCellNib, forCellReuseIdentifier: "AddTeamLabelTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelAction(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.numberOfRowInSection[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Configure the cell...
        var reuseId = ""
        
        var cellReturn:UITableViewCell?
        
        switch indexPath.section {
        case 0 :
            reuseId = "AddTeamLabelTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            cell.addTeamDetailText.textColor = UIColor.grayColor()
            let placeholder = NSAttributedString(string: "請輸入暱稱", attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
            cell.addTeamDetailText.attributedPlaceholder = placeholder
            //cell.addTeamDetailIcon.image = UIImage(named: "icon_field_account_mail_3x")
            cell.textFieldType = TextFieldType.NickName
            cell.delegate = self
            cellReturn = cell
            
        case 1 :
            switch indexPath.row {
            case 0:
                reuseId = "AddTeamLabelTableViewCell"
                let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
                cell.addTeamDetailText.textColor = UIColor.grayColor()
                let placeholder = NSAttributedString(string: "請輸入信箱", attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
                cell.addTeamDetailText.attributedPlaceholder = placeholder
                cell.addTeamDetailIcon.image = UIImage(named: "icon_field_mail_3x")
                cell.bottomLineView.backgroundColor = UIColor.lightGrayColor()
                cell.textFieldType = TextFieldType.Account
                cell.delegate = self
                cellReturn = cell
            case 1:
                reuseId = "AddTeamLabelTableViewCell"
                let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
                cell.addTeamDetailText.textColor = UIColor.grayColor()
                let placeholder = NSAttributedString(string: "請輸入密碼", attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
                cell.addTeamDetailText.attributedPlaceholder = placeholder
                cell.addTeamDetailIcon.image = UIImage(named: "ico_field_pwd_3x")
                cell.bottomLineView.backgroundColor = UIColor.lightGrayColor()
                cell.textFieldType = TextFieldType.Password
                cell.delegate = self
                cellReturn = cell
            case 2:
                reuseId = "AddTeamLabelTableViewCell"
                let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
                cell.addTeamDetailText.textColor = UIColor.grayColor()
                let placeholder = NSAttributedString(string: "請再次輸入密碼", attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
                cell.addTeamDetailText.attributedPlaceholder = placeholder
                // cell.addTeamDetailIcon.image = UIImage(named: "icon_field_account_mail_3x")
                cell.textFieldType = TextFieldType.Password
                cell.delegate = self
                cellReturn = cell
            default :
                break
            }
        case 2:
            reuseId = "AddTeamLabelTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            cell.addTeamDetailText.textColor = UIColor.grayColor()
            let placeholder = NSAttributedString(string: "請輸入ID", attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
            cell.addTeamDetailText.attributedPlaceholder = placeholder
            cell.addTeamDetailIcon.image = UIImage(named: "ico_field_setid_3x")
            cell.textFieldType = TextFieldType.UserId
            cell.delegate = self
            cellReturn = cell
        case 3 :
            reuseId = "AddTeamLabelTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            cell.addTeamDetailText.textColor = UIColor.grayColor()
            let placeholder = NSAttributedString(string: "請選擇性別", attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
            cell.addTeamDetailText.attributedPlaceholder = placeholder
            // cell.addTeamDetailIcon.image = UIImage(named: "icon_field_account_mail_3x")
            cell.addTeamDetailText.allowsEditingTextAttributes = false
            cell.textFieldType = TextFieldType.Gender
            cell.delegate = self
            self.gender = cell
            cellReturn = cell
        case 4 :
            reuseId = "buttonCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! ButtonTableViewCell
            cell.buttonInCell.setBackgroundImage(UIImage(named: "btn_account_creat_3x"), forState: .Normal)
            cell.type = ButtonType.ApiLogin
            cell.delegate = self
            cellReturn = cell
        default :
            break
        }
        
        switch reuseId {
        case "buttonCell":
            cellReturn?.backgroundColor = UIColor.clearColor()
        default:
            cellReturn?.backgroundColor = UIColor.whiteColor()
        }
        
        return cellReturn!
        
    }
    
    
    // MARK: - customDelegate
    
    func buttonClick(buttonType: ButtonType) {
        // register
        // api
    }
    
    func getText(type: TextFieldType, enterText: String) {
        switch type {
        case .Password :
            print(enterText)
        case .NickName :
            print(enterText)
        case .Email :
            print(enterText)
        case .UserId :
            print(enterText)
        case .Gender :
            print(enterText)
        default :
            break
        }
    }
    
    func callPicker(sender: UITableViewCell, pickerContent: [String]) {
        self.numberOfPicker = pickerContent.count
        self.numberOfComponentsInPicker = 1
        self.pickerContent = pickerContent
        
//        let chose = UIAlertController(title: "性別", message: "", preferredStyle: .ActionSheet)
//        
//        for item in pickerContent {
//            let choseItem = UIAlertAction(title: item, style: .Default, handler: { UIAlertAction in
//                self.endPicked(sender, title: item)
//            })
//            chose.addAction(choseItem)
//        }
//        
//        presentViewController(chose, animated: true, completion: nil)
        
        //let genderPicker = UIPickerView(frame: CGRect(x: 0, y: UIScreen.mainScreen().bounds.height * 2/3 , width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height/2 ))
        self.genderPicker.delegate = self
        self.genderPicker.dataSource = self
        
        self.blackBackGround = UIView(frame: CGRect(x: 0, y: 0 , width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height ))
        self.blackBackGround.backgroundColor = UIColor.blackColor()
        self.blackBackGround.alpha = 0.5
        self.view.addSubview(self.blackBackGround)
//        self.view.addSubview(genderPicker)
        
        self.pickerBackgroundView.frame = CGRect(x: 0, y: UIScreen.mainScreen().bounds.height * 8/10 , width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height * 2/10 )
        self.view.addSubview(pickerBackgroundView)
        
    }
    
    
    
    func endPicked(sender: UITableViewCell, title:String) {
        let cell = sender as! AddTeamLabelTableViewCell
        cell.addTeamDetailText.text = title
    }
    
//    // MARK: - UIPickerViewDataSource
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.numberOfPicker
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return self.numberOfComponentsInPicker
    }

    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerContent[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("end picker")
        self.selectedGender = pickerContent[row]
    }
    
    @IBAction func didSelectAction(sender: UIButton) {
        self.blackBackGround.removeFromSuperview()
        self.pickerBackgroundView.removeFromSuperview()
        self.gender.addTeamDetailText.text = self.selectedGender
        self.gender.addTeamDetailText.resignFirstResponder()
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
