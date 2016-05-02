//
//  AddTeamTableViewController.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/5/1.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class AddTeamTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
//         self.tableView.registerNib(UINib(nibName: "AddTeamImageTableViewCell",bundle: nil), forCellReuseIdentifier: "AddTeamImageTableViewCell")
        

        
        self.tableView.registerNib(UINib(nibName: "AddTeamLabelTableViewCell",bundle: nil), forCellReuseIdentifier: "AddTeamLabelTableViewCell")
        
//        tableView.estimatedRowHeight = 300.0
//        tableView.rowHeight = UITableViewAutomaticDimension

        
        
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
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //設定每個header的高度
                return 20
      }
   
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
            
//        case 0 :
//            
//        let cell = tableView.dequeueReusableCellWithIdentifier("AddTeamImageTableViewCell", forIndexPath: indexPath) as! AddTeamImageTableViewCell
//        
//        cell.addTeamImage.image = UIImage(named: "warrior")
//            
//        return cell
            
        case 0:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("AddTeamLabelTableViewCell", forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            
            cell.addTeamDetailIcon.image = UIImage(named:"" )
            cell.addTeamDetailText.placeholder = "請輸入球隊名稱"
            return cell
            
            
        case 1:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("AddTeamLabelTableViewCell", forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            
            cell.addTeamDetailIcon.image = UIImage(named:"t_user" )
            cell.addTeamDetailText.placeholder = "聚會時間"
            cell.addTeamDetailText.userInteractionEnabled = false
            
            return cell
            
        
        case 2:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("AddTeamLabelTableViewCell", forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            
            cell.addTeamDetailIcon.image = UIImage(named:"t_user" )
            cell.addTeamDetailText.placeholder = "球場位置"
            cell.accessoryType = .DisclosureIndicator
            cell.addTeamDetailText.userInteractionEnabled = false
            
            return cell
            
        case 3:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("AddTeamLabelTableViewCell", forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            
            cell.addTeamDetailIcon.image = UIImage(named:"t_user" )
            cell.addTeamDetailText.placeholder = "加入成員"
            cell.accessoryType = .DisclosureIndicator
            cell.addTeamDetailText.userInteractionEnabled = false
            return cell
           
        default:
            
            let cell = AddTeamLabelTableViewCell()
            return cell
    }
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
