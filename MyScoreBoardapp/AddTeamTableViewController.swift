//
//  AddTeamTableViewController.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/5/1.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class AddTeamTableViewController: UITableViewController,AddMemberDelegate {

    @IBOutlet var pickerBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let teams = Teams.sharedInstance
        
        print(teams)
        
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
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        //Add cases here to move to different segues
      
        if indexPath.section == 1{
            self.view.addSubview(pickerBackgroundView)
            
      
        }
        
        if indexPath.section == 2{
            self.performSegueWithIdentifier("showAddGameLocation", sender: self)
        }else if indexPath.section == 3{
            self.performSegueWithIdentifier("showAddTeamMember", sender: self)
        }else{
        
        }
        }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showAddGameLocation" {
//            let desViewcontroller = segue.destinationViewController as! AddTeamMemberViewController
////            desViewcontroller.student = class1.students[0]
////            desViewcontroller.delegate = self
//        }
//    }

    

    func addMemberChanged(newMember:String){
    
    
    }
    
}
