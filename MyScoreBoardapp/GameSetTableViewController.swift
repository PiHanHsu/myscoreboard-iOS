//
//  GameSetTableViewController.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/6/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class GameSetTableViewController: BasicTableViewController, buttonCellDelegate, labelCellDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    var numberOfPicker = 0
    var numberOfComponentsInPicker = 0
    var pickerContent:[String] = []
    let numberOfRowInSection = [1,1,1,1,1]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var blackBackGround: UIView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
            
        
            
        self.picker = self.pickerBackGroundView as! PickerView
        self.picker!.delegate = self
            
            
            let player1 = Player()
            player1.playerName = "Steven"
            player1.didSelectToJoinGame = false
            teamPlayers.append(player1)
            let player2 = Player()
            player2.playerName = "Steph"
            player2.didSelectToJoinGame = false
            teamPlayers.append(player2)
            let player3 = Player()
            player3.playerName = "Dyson"
            player3.didSelectToJoinGame = false
            teamPlayers.append(player3)
            let player4 = Player()
            player4.playerName = "Damon"
            player4.didSelectToJoinGame = false
            teamPlayers.append(player4)
            let player5 = Player()
            player5.playerName = "Pihan"
            player5.didSelectToJoinGame = false
            teamPlayers.append(player5)
            let player6 = Player()
            player6.playerName = "Abear"
            player6.didSelectToJoinGame = false
            teamPlayers.append(player6)
            let player7 = Player()
            player7.playerName = "Eric"
            player7.didSelectToJoinGame = false
            teamPlayers.append(player7)
            let player8 = Player()
            player8.playerName = "Veronica"
            player8.didSelectToJoinGame = false
            teamPlayers.append(player8)
            let player9 = Player()
            player9.playerName = "Will"
            player9.didSelectToJoinGame = false
            teamPlayers.append(player9)
            let player10 = Player()
            player10.playerName = "Martin"
            player10.didSelectToJoinGame = false
            teamPlayers.append(player10)
            
            team.players = teamPlayers
            Teams.sharedInstance.addTeam(team)
        
=======
>>>>>>> parent of 18b2784... commit for rehearsal

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
            
            
            self.tableView.backgroundColor = UIColor.lightGrayColor()
            // cell register
            let buttonCellNib = UINib(nibName: "ButtonTableViewCell", bundle: nil)
            let labelCellNib = UINib(nibName: "AddTeamLabelTableViewCell", bundle: nil)
            let collectionCellNib = UINib(nibName: "CollectionViewInTableViewCell", bundle: nil)
            
            self.tableView.registerNib(buttonCellNib, forCellReuseIdentifier: "buttonCell")
            self.tableView.registerNib(labelCellNib, forCellReuseIdentifier: "AddTeamLabelTableViewCell")
            self.tableView.registerNib(collectionCellNib, forCellReuseIdentifier: "CollectionViewInTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var estimatedHeight = CGFloat(0)
        if indexPath.section == 1 {
            estimatedHeight = UIScreen.mainScreen().bounds.height / 3
        }else {
            estimatedHeight = CGFloat(44)
        }
        
        return estimatedHeight
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 0:
            title = "記錄球隊"
        case 1:
            title = "請選取已到場成員"
        case 2:
            title = "臨打人數"
        case 3:
            title = "排賽模式"
        case 4:
            //title = "記錄球隊"
            break
        default :
            break
        }
        
        return title
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Configure the cell...
        var reuseId = ""
        var cellReturn:UITableViewCell?
        
        switch indexPath.section {
        case 0:
            reuseId = "AddTeamLabelTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            cell.addTeamDetailText.textColor = UIColor.grayColor()
            let placeholder = NSAttributedString(string: "選擇球隊", attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
            cell.addTeamDetailText.attributedPlaceholder = placeholder
            cell.textFieldType = TextFieldType.Gender
            cell.delegate = self
            
            cellReturn = cell
        case 1:
            reuseId = "CollectionViewInTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! CollectionViewInTableViewCell
            cell.collectionViewInCell.delegate = self
            cell.collectionViewInCell.dataSource = self
            let cellNib = UINib(nibName: "PlayerCardCollectionViewCell", bundle: nil)
            cell.collectionViewInCell.registerNib(cellNib, forCellWithReuseIdentifier: "PlayerCardCollectionViewCell")
            
            cellReturn = cell
            
        case 2:
            reuseId = "AddTeamLabelTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            cell.addTeamDetailText.textColor = UIColor.grayColor()
            let placeholder = NSAttributedString(string: "臨打人數", attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
            cell.addTeamDetailText.attributedPlaceholder = placeholder
            cell.textFieldType = TextFieldType.Gender
            cell.delegate = self
            
            cellReturn = cell
        case 3:
            reuseId = "AddTeamLabelTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
            cell.addTeamDetailText.textColor = UIColor.grayColor()
            let placeholder = NSAttributedString(string: "排賽模式", attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
            cell.addTeamDetailText.attributedPlaceholder = placeholder
            cell.textFieldType = TextFieldType.Gender
            cell.delegate = self
            
            cellReturn = cell
        case 4:
            reuseId = "buttonCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! ButtonTableViewCell
            cell.buttonInCell.setBackgroundImage(UIImage(named: "bn_login_3x"), forState: .Normal)
            cell.backgroundColor = UIColor.clearColor()
            cell.type = ButtonType.FBLogin
            cell.delegate = self
            cellReturn = cell
        default:
            break
        }
        
        
        return cellReturn!
    }
    
<<<<<<< HEAD
    // MARK: - pickerDelegate
    
    func didSelect(pickerType: PickerType, pickerItem: String) {
        print(pickerItem)
        switch pickerType {
        case .ChoseTeam:
            Game.shareInstance.TeamId = 9
            let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as! AddTeamLabelTableViewCell
            cell.addTeamDetailText.text = pickerItem
        case .GameMode:
            let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 3)) as! AddTeamLabelTableViewCell
            switch pickerItem {
            case GameSetType.Automatic:
                cell.addTeamDetailText.text = GameSetType.Automatic
            case GameSetType.Manual:
                cell.addTeamDetailText.text = GameSetType.Manual
            default:
                break
            }
        default:
            break
        }
    }
    
   
=======
>>>>>>> parent of 18b2784... commit for rehearsal
    // MARK: - labelCellDelegate
    func getText(type: TextFieldType, enterText: String) {
        
    }
    
    func callPicker(sender: UITableViewCell, pickerContent: [String]) {
        self.numberOfPicker = pickerContent.count
        self.numberOfComponentsInPicker = 1
        self.pickerContent = pickerContent
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
<<<<<<< HEAD
        
        self.blackBackGround = UIView(frame: CGRect(x: 0, y: 0 , width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height ))
        self.blackBackGround.backgroundColor = UIColor.blackColor()
        self.blackBackGround.alpha = 0.5
        self.view.addSubview(self.blackBackGround)
        //        self.view.addSubview(genderPicker)
        
=======
        
        self.blackBackGround = UIView(frame: CGRect(x: 0, y: 0 , width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height ))
        self.blackBackGround.backgroundColor = UIColor.blackColor()
        self.blackBackGround.alpha = 0.5
        self.view.addSubview(self.blackBackGround)
        //        self.view.addSubview(genderPicker)
        
>>>>>>> parent of 18b2784... commit for rehearsal
        self.blackBackGround.frame = CGRect(x: 0, y: UIScreen.mainScreen().bounds.height * 8/10 , width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height * 2/10 )
        self.view.addSubview(blackBackGround)
        
    }

    // MARK: - UIPickerViewDataSource
<<<<<<< HEAD
    
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
    
=======
    
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
    
>>>>>>> parent of 18b2784... commit for rehearsal
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("end picker")
    }
    

    
    // MARK: - buttonCellDelegate
    
    func buttonClick(buttonType: ButtonType) {
        // start game
        let destinationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GameScoreViewController")
        self.navigationController?.pushViewController(destinationController, animated: true)
    }

    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PlayerCardCollectionViewCell", forIndexPath: indexPath) as! PlayerCardCollectionViewCell
<<<<<<< HEAD
=======
        
        cell.playerImage.image = UIImage(named: "warrior")
        cell.playerName.text = "Golden Warrior"
>>>>>>> parent of 18b2784... commit for rehearsal
        
        cell.playerImage.image = UIImage(named: "warrior")
        cell.playerName.text = "Golden Warrior"
        
        if Teams.sharedInstance.teams[0].players[indexPath.row].didSelectToJoinGame {
            cell.frameView.image = UIImage(named: "frame_member_pick_blue")
        } else {
            cell.frameView.image = UIImage()
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = UIScreen.mainScreen().bounds.width / 4
        return CGSize(width: width , height: width)
<<<<<<< HEAD
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        Teams.sharedInstance.teams[0].players[indexPath.row].didSelectToJoinGame = Teams.sharedInstance.teams[0].players[indexPath.row].didSelectToJoinGame ? false : true
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! PlayerCardCollectionViewCell
        if Teams.sharedInstance.teams[0].players[indexPath.row].didSelectToJoinGame {
            cell.frameView.image = UIImage(named: "frame_member_pick_blue")
        } else {
            cell.frameView.image = UIImage()
        }
=======
>>>>>>> parent of 18b2784... commit for rehearsal
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
