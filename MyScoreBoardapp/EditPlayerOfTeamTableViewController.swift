//
//  EditPlayerOfTeamTableViewController.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/5/4.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class EditPlayerOfTeamTableViewController: UITableViewController {
    
    @IBOutlet var playertableview: UITableView!
    
    
     let team1 = Team()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            let player1 = Player()
            player1.playerImageUrl = "player1"
            player1.playerName = "abear"
            
            let player2 = Player()
            player2.playerImageUrl = "player1"
            player2.playerName = "abear"
            
            let player3 = Player()
            player3.playerImageUrl = "player1"
            player3.playerName = "abear"
            
            let player4 = Player()
            player4.playerImageUrl = "player1"
            player4.playerName = "abear"
            let player5 = Player()
            player5.playerImageUrl = "player1"
            player5.playerName = "abear"
            let player6 = Player()
            player6.playerImageUrl = "player1"
            player6.playerName = "abear"
            let player7 = Player()
            player7.playerImageUrl = "player1"
            player7.playerName = "abear"
            let player8 = Player()
            player8.playerImageUrl = "player1"
            player8.playerName = "abear"
            let player9 = Player()
            player9.playerImageUrl = "player1"
            player9.playerName = "abear"
            let player10 = Player()
            player10.playerImageUrl = "player1"
            player10.playerName = "abear"
            let player11 = Player()
            player11.playerImageUrl = "player1"
            player11.playerName = "abear"
            let player12 = Player()
            player12.playerImageUrl = "player1"
            player12.playerName = "abear"
            
            
            
            
            
            
            team1.players.append(player1)
            team1.players.append(player2)
            team1.players.append(player3)
            team1.players.append(player4)
            team1.players.append(player5)
            team1.players.append(player6)
            team1.players.append(player7)
            team1.players.append(player8)
            team1.players.append(player9)
            team1.players.append(player10)
            team1.players.append(player11)
            team1.players.append(player12)


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
//        tableView.setEditing(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return team1.players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EditPlayerOfTeamTableViewCell", forIndexPath: indexPath) as! EditPlayerOfTeamTableViewCell
        
        cell.playerImage.image =  UIImage(named: (team1.players[indexPath.row].playerImageUrl)!)
        cell.playerNameofTeam.text = team1.players[indexPath.row].playerName
        cell.playerNameofTeam.layer.cornerRadius = cell.playerNameofTeam.frame.height/2
        cell.playerNameofTeam.layer.masksToBounds = true

  

        return cell
    }
    


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //api call
            
            team1.players.removeAtIndex(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
