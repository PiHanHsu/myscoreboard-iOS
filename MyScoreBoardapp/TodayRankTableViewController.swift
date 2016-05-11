//
//  TodayRankTableViewController.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/9/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit


class TodayRankTableViewController: BasicTableViewController {
    
    var todayScores = Scores()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.bounces = true
        
        let cellNib = UINib(nibName: "TodayRankTableViewCell", bundle: nil)
        self.tableView.registerNib(cellNib, forCellReuseIdentifier: "TodayRankTableViewCell")
        
        
        //data
        let game1 = Score()
        game1.blueTeamScore = 21
        game1.blueTeamPlayerOne = "Steven"
        game1.blueTeamPlayerTwo = ""
        game1.redTeamScore = 19
        game1.redTeamPlayerOne = "Damon"
        game1.redTeamPlayerTwo = ""
        self.todayScores.score.append(game1)
        let game2 = Score()
        game2.blueTeamScore = 21
        game2.blueTeamPlayerOne = "Dyson"
        game2.blueTeamPlayerTwo = ""
        game2.redTeamScore = 19
        game2.redTeamPlayerOne = "PiHan"
        game2.redTeamPlayerTwo = ""
        self.todayScores.score.append(game2)
        let game3 = Score()
        game3.blueTeamScore = 17
        game3.blueTeamPlayerOne = "Joyce"
        game3.blueTeamPlayerTwo = ""
        game3.redTeamScore = 21
        game3.redTeamPlayerOne = "Veronica"
        game3.redTeamPlayerTwo = ""
        self.todayScores.score.append(game3)
        let game4 = Score()
        game4.blueTeamScore = 16
        game4.blueTeamPlayerOne = "Dyson"
        game4.blueTeamPlayerTwo = ""
        game4.redTeamScore = 21
        game4.redTeamPlayerOne = "Damon"
        game4.redTeamPlayerTwo = ""
        self.todayScores.score.append(game4)
        let game5 = Score()
        game5.blueTeamScore = 21
        game5.blueTeamPlayerOne = "Steven"
        game5.blueTeamPlayerTwo = ""
        game5.redTeamScore = 14
        game5.redTeamPlayerOne = "Dyson"
        game5.redTeamPlayerTwo = ""
        self.todayScores.score.append(game5)
        let game6 = Score()
        game6.blueTeamScore = 19
        game6.blueTeamPlayerOne = "PiHan"
        game6.blueTeamPlayerTwo = ""
        game6.redTeamScore = 21
        game6.redTeamPlayerOne = "Steven"
        game6.redTeamPlayerTwo = ""
        self.todayScores.score.append(game6)
        let game7 = Score()
        game7.blueTeamScore = 24
        game7.blueTeamPlayerOne = "Damon"
        game7.blueTeamPlayerTwo = ""
        game7.redTeamScore = 22
        game7.redTeamPlayerOne = "PiHan"
        game7.redTeamPlayerTwo = ""
        self.todayScores.score.append(game7)
        let game8 = Score()
        game8.blueTeamScore = 18
        game8.blueTeamPlayerOne = "Veronica"
        game8.blueTeamPlayerTwo = ""
        game8.redTeamScore = 21
        game8.redTeamPlayerOne = "Joyce"
        game8.redTeamPlayerTwo = ""
        self.todayScores.score.append(game8)
        
        
        let backItem = UIBarButtonItem()
        backItem.title = "計分板"
        backItem.target = self
        backItem.action = #selector(self.backToGameScore)
        self.navigationItem.setLeftBarButtonItem(backItem, animated: true)
        self.navigationItem.title = "今日歷史紀錄"
        
        
        //self.navigationItem.leftBarButtonItem = backItem
        // Do any additional setup after loading the view.
    }
    
    func backToGameScore() {
        self.navigationController?.popViewControllerAnimated(true)
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
        return self.todayScores.score.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TodayRankTableViewCell", forIndexPath: indexPath) as! TodayRankTableViewCell
        
        let score = self.todayScores.score[indexPath.row]
        
        cell.redTeamScore.text = String(score.redTeamScore)
        cell.redTeamPlayerOne.text = score.redTeamPlayerOne
        cell.redTeamPlayerTwo.text = score.redTeamPlayerTwo
        
        cell.blueTeamScore.text = String(score.blueTeamScore)
        cell.blueTeamPlayerOne.text = score.blueTeamPlayerOne
        cell.blueTeamPlayerTwo.text = score.blueTeamPlayerTwo
        
        if score.redTeamScore < score.blueTeamScore {
            cell.redTeamScore.textColor = UIColor(red: CGFloat(68)/255, green: CGFloat(94)/255, blue: CGFloat(119)/255, alpha: CGFloat(1))
        } else {
            cell.blueTeamScore.textColor = UIColor(red: CGFloat(68)/255, green: CGFloat(94)/255, blue: CGFloat(119)/255, alpha: CGFloat(1))
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(UIScreen.mainScreen().bounds.height / 10)
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
