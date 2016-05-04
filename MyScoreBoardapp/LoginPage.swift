//
//  LoginPage.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/3/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class LoginPage: UITableViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var footerView: UIView!
    let eachNumberOfRowInSection = [1,1,2,1]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // table init
        self.headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height / 2.5)
        //self.footerView.frame = CGRect(x: 0, y:UIScreen.mainScreen().bounds.height * 9 / 10, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height / 10)
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "bg_login"))
        self.tableView.separatorStyle = .None
        self.tableView.allowsSelection = false
        self.tableView.bounces = false
        
        // cell register
        let buttonCellNib = UINib(nibName: "ButtonTableViewCell", bundle: nil)
        let labelCellNib = UINib(nibName: "AddTeamLabelTableViewCell", bundle: nil)
        let orCellNib = UINib(nibName: "OrTableViewCell", bundle: nil)
        
        self.tableView.registerNib(buttonCellNib, forCellReuseIdentifier: "buttonCell")
        self.tableView.registerNib(labelCellNib, forCellReuseIdentifier: "labelCell")
        self.tableView.registerNib(orCellNib, forCellReuseIdentifier: "orCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eachNumberOfRowInSection[section]
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Configure the cell...
        var reuseId = ""

        var cellReturn:UITableViewCell?
    
        
        switch indexPath.section {
        case 0 :
            reuseId = "buttonCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! ButtonTableViewCell
            cell.buttonInCell.setBackgroundImage(UIImage(named: "bn_login_3x"), forState: .Normal)
            cellReturn = cell
            
        case 2 :
            switch indexPath.row {
            case 0:
                reuseId = "labelCell"
                let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
                cell.addTeamDetailText.textColor = UIColor.whiteColor()
                let placeholder = NSAttributedString(string: "信箱", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
                cell.addTeamDetailText.attributedPlaceholder = placeholder
                cell.addTeamDetailIcon.image = UIImage(named: "icon_field_account_mail_3x")
                cellReturn = cell
            default:
                reuseId = "labelCell"
                let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
                cell.addTeamDetailText.textColor = UIColor.whiteColor()
                let placeholder = NSAttributedString(string: "密碼", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
                cell.addTeamDetailText.attributedPlaceholder = placeholder
                cell.addTeamDetailIcon.image = UIImage(named: "ico_field_account_pwd_3x")
                cellReturn = cell
            }
        case 3 :
            reuseId = "buttonCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! ButtonTableViewCell
            cell.buttonInCell.setBackgroundImage(UIImage(named: "bn_account_login_normal_3x"), forState: .Normal)
            cellReturn = cell
        default:
            reuseId = "orCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! OrTableViewCell
            cell.labelInCell.textColor = UIColor.whiteColor()
            
            cellReturn = cell
        }
        
        cellReturn?.backgroundColor = UIColor.clearColor()
        return cellReturn!
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.alpha = 0
        return headerView
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
