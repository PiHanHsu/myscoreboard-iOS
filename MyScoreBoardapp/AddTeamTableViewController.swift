//
//  AddTeamTableViewController.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/5/1.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class AddTeamTableViewController: UITableViewController,AddMemberDelegate,UIPickerViewDelegate,UIPickerViewDataSource, GooglePlacesAutocompleteDelegate,UITextFieldDelegate {

    
    var isAddTeam = false
    @IBOutlet var pickerBackgroundView: UIView!
    @IBOutlet weak var gameTimepicker: UIPickerView!
    @IBOutlet weak var TeamImageuploadbackground: UIView!
    @IBOutlet weak var countText: UILabel!
    
    let dayArray = ["星期一","星期二","星期三","星期四","星期五","星期六","星期日"]
    let startTimeArray = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00:","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00:","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00:","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"]
    let endTimeArray = ["00:00","00:30","01:00:","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00:","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00:","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00:","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"]

    var daytime:String?
    var starttime:String?
    var endtime:String?
    
    let gpaViewController = GooglePlacesAutocomplete(
        apiKey: "AIzaSyD9Phzy4CZWofeZD3RnEuFemlWTaM4n_po",
        placeType: .Address
    )

    
    var totalTime:String?
    //will add
    var gameTime:AddTeamLabelTableViewCell?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isAddTeam == false {
        navigationItem.title = ""
        }else{
        navigationItem.title = ""
        }
        

        let teams = Teams.sharedInstance
        
        print(teams)
        
        daytime = dayArray[0]
        starttime = startTimeArray[0]
        endtime = endTimeArray[0]

        gpaViewController.placeDelegate = self
        
        self.TeamImageuploadbackground.frame = CGRect(x: 0, y: 0 , width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height/4)
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
//         self.tableView.registerNib(UINib(nibName: "AddTeamImageTableViewCell",bundle: nil), forCellReuseIdentifier: "AddTeamImageTableViewCell")
        

        
        self.tableView.registerNib(UINib(nibName: "AddTeamLabelTableViewCell",bundle: nil), forCellReuseIdentifier: "AddTeamLabelTableViewCell")
        
//        tableView.estimatedRowHeight = 300.0
//        tableView.rowHeight = UITableViewAutomaticDimension

        
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.characters.count ?? 0
        
        
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.characters.count - range.length
    
        if newLength < 21 {
            self.countText.text = "\(newLength)"
            return true
        }
        else {
            return false
        }
        
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
            cell.addTeamDetailText.delegate = self
            return cell
            
        case 1:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("AddTeamLabelTableViewCell", forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            
            cell.addTeamDetailIcon.image = UIImage(named:"t_user" )
            cell.addTeamDetailText.placeholder = "聚會時間"
            cell.addTeamDetailText.userInteractionEnabled = false
            cell.addTeamDetailText.text = ""

            gameTime = cell
            
            
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
            
            self.pickerBackgroundView.frame = CGRect(x: 0, y: UIScreen.mainScreen().bounds.height/2 , width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height/2 )
            self.view.addSubview(pickerBackgroundView)
            
        }
        
        if indexPath.section == 2{
            presentViewController(gpaViewController, animated: true, completion: nil)
            
            //self.performSegueWithIdentifier("showAddGameLocation", sender: self)
            
        }else if indexPath.section == 3{
            
            if isAddTeam == true{
                self.performSegueWithIdentifier("showAddTeamMember", sender: self)}
            else{
                self.performSegueWithIdentifier("showEditTeamMember", sender: self)
            }
        }else{
        
        }
    }
    
    //after select place from gpaViewController
    func placeSelected(place: Place){
        place.getDetails { details in
            print(details.raw)
            
            
            
            
        }
    }

    
    //首先先把要顯示的資料分別存在兩個Array
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3   //有多少個 component
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //設定每個 component 有幾列
        if component == 0{
            return dayArray.count //第一個Component要顯示的數量
        }else if component == 1{
            return startTimeArray.count //第二個Component要顯示的數量
            
        }else{
            return endTimeArray.count  //第三個Component要顯示的數量
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return dayArray[row]  //第一個Component要顯示的文字
            
        }else if component == 1{
            return startTimeArray[row] //第二個Component要顯示的數量
            
        }else{
            return endTimeArray[row]   //第三個Component要顯示的文字
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0{
            daytime = dayArray[row]
            //            print("number: \(dayArray[row])") //點擊第一個Component
        }else if component == 1 {
            
            starttime = startTimeArray[row]
            //            print("startTime: \(startTimeArray[row])")   //點擊第二個Component
        }else{
            endtime = endTimeArray[row]
            //            print("endTime: \(endTimeArray[row])")   //點擊第三個Component
        }
        
        totalTime = daytime!+" "+starttime!+"-"+endtime!
        //        pickerView.removeFromSuperview()
//        (totalTime!)
    }
    
    @IBAction func finishAddTimeBtn(sender: AnyObject) {
        
        
            gameTime?.addTeamDetailText.text = totalTime!
            pickerBackgroundView.removeFromSuperview()
    
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
