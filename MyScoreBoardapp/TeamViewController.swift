//
//  TeamViewController.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/4/30.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit
import Accelerate
import SwiftyJSON

class TeamViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, MyCollectionViewCellProtocal {
    
    var editTeamButton:UIBarButtonItem?
    var teams = [Team]()
    var number:Int = 0
    @IBOutlet weak var teamCollectionView: UICollectionView!
    @IBOutlet weak var teamLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var recordScoreButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTeamButton = self.navigationItem.rightBarButtonItem
        self.teamCollectionView.registerNib(UINib(nibName: "TeamCollectionViewCell",bundle: nil), forCellWithReuseIdentifier: "TeamCollectionViewCell")
        
        
        self.teamCollectionView.registerNib(UINib(nibName: "addTeamCollectionViewCell",bundle: nil), forCellWithReuseIdentifier: "addTeamCollectionViewCell")
        
        
        self.teamCollectionView.dataSource = self
        self.teamCollectionView.delegate = self
        
        self.recordScoreButton.layer.cornerRadius = 5
        
        
        
        //        let player1 = Player()
        //        player1.playerImageUrl = "player1"
        //        player1.playerName = "abear"
        //
        //        let player2 = Player()
        //        player2.playerImageUrl = "player1"
        //        player2.playerName = "abear"
        //
        //        let player3 = Player()
        //        player3.playerImageUrl = "player1"
        //        player3.playerName = "abear"
        //
        //        let player4 = Player()
        //        player4.playerImageUrl = "player1"
        //        player4.playerName = "abear"
        //        let player5 = Player()
        //        player5.playerImageUrl = "player1"
        //        player5.playerName = "abear"
        //        let player6 = Player()
        //        player6.playerImageUrl = "player1"
        //        player6.playerName = "abear"
        //        let player7 = Player()
        //        player7.playerImageUrl = "player1"
        //        player7.playerName = "abear"
        //        let player8 = Player()
        //        player8.playerImageUrl = "player1"
        //        player8.playerName = "abear"
        //        let player9 = Player()
        //        player9.playerImageUrl = "player1"
        //        player9.playerName = "abear"
        //        let player10 = Player()
        //        player10.playerImageUrl = "player1"
        //        player10.playerName = "abear"
        //        let player11 = Player()
        //        player11.playerImageUrl = "player1"
        //        player11.playerName = "abear"
        //        let player12 = Player()
        //        player12.playerImageUrl = "player1"
        //        player12.playerName = "abear"
        //
        //
        //
        //
        //
        //
        //
        //        let team1 = Team()
        ////
        //        team1.TeamImageUrl = "warrior"
        //        team1.TeamName = "金州勇士隊"
        //        team1.GameTimeDay = "星期三"
        //        team1.GameTimeHour = "18:00 - 20:00"
        //        team1.GameLocation = "中正運動中心"
        //        team1.players.append(player1)
        //        team1.players.append(player2)
        //        team1.players.append(player3)
        //        team1.players.append(player4)
        //        team1.players.append(player5)
        //        team1.players.append(player6)
        //        team1.players.append(player7)
        //        team1.players.append(player8)
        //        team1.players.append(player9)
        //        team1.players.append(player10)
        //        team1.players.append(player11)
        //        team1.players.append(player12)
        
        
        
        //        let team2 = Team()
        //
        //        team2.TeamImageUrl = "warrior"
        //        team2.TeamName = "金州勇士隊"
        //        team2.GameTimeDay = "星期三"
        //        team2.GameTimeHour = "18:00 - 20:00"
        //        team2.GameLocation = "中正運動中心"
        //        team2.players.append(player1)
        //
        //        teams.append(team1)
        //        teams.append(team2)
        
        HttpManager.sharedInstance
            .request(HttpMethod.HttpMethodGet,
                     apiFunc: APiFunction.GetTeamList,
                     param: ["auth_token" : "HWNisxMz3HSjwcGjGeoP",
                        ":user_id":"1"],
                     success: { (code , data ) in
                        //self.success(code, data: data)
                        for team in data["results"].arrayValue {
                            
                            Teams.sharedInstance.teams.append(Team(data: team))
                            
                        }
                        
                        self.teamCollectionView.reloadData()
                },
                     failure: { (code , data) in
                        self.failure(code!, data: data!)
                },
                     complete: nil)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        // MARK: - 5.重載資料
        self.teamCollectionView.reloadData()
    }
    
    func success(code:Int, data:JSON ) {
        print("\(#function)")
        print(code)
        print(data)
    }
    
    func failure(code:Int, data:JSON ) {
        print("\(#function)")
        print(code)
        print(data)
    }
    
    
    
    //計算每個 Cell 的大小，大小會決定一排會呈現幾個 Cell
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let widthSize = self.teamCollectionView.frame.size.width
        let heightSize = self.teamCollectionView.frame.size.height
        return CGSize.init(width: widthSize, height: heightSize)
        //        return CGSizeMake(300, 300)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Teams.sharedInstance.teams.count + 1
        //        return self.teams.count+1
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        self.teams = Teams.sharedInstance.teams
        
        if indexPath.row < self.teams.count{
            
            let myCell = collectionView.dequeueReusableCellWithReuseIdentifier("TeamCollectionViewCell", forIndexPath: indexPath) as! TeamCollectionViewCell
            
            let myTeams = Teams.sharedInstance.teams[indexPath.row]
            myCell.delegate = self
            // give data to childCell
            // MARK: - 7.重載成員的collectionView cell data
            myCell.team = myTeams
            myCell.childCollectionView.reloadData()
            
            myCell.teamImageUrl.image = UIImage(named: (Teams.sharedInstance.teams[indexPath.row].TeamImageUrl)!)
            myCell.teamNameLabel.text = Teams.sharedInstance.teams[indexPath.row].TeamName
            myCell.gameTimeDay.text = Teams.sharedInstance.teams[indexPath.row].GameTimeDay
            myCell.gameTimeHour.text = Teams.sharedInstance.teams[indexPath.row].GameTimeHour
            myCell.gameLocation.text = Teams.sharedInstance.teams[indexPath.row].GameLocation
            
            // 成員的collectionView
            //myCell.childCollectionView
            
            return myCell
            
        }else if indexPath.row == self.teams.count{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("addTeamCollectionViewCell", forIndexPath: indexPath) as! addTeamCollectionViewCell
            
            cell.addTeamImage.image = UIImage(named:"bn_team_create_normal_3x")
            
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("addTeamCollectionViewCell", forIndexPath: indexPath) as! addTeamCollectionViewCell
            return cell
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // Bug
        performSegueWithIdentifier("showAddTeam", sender: self)
    }
    
    //Delegate 方法，取得 TeamCollectionViewCell 中的 PlayerCardCollectionViewCell 被選擇的 Player 資訊
    func didSelectedChild(player:Player) {
        print("player name: \(player.playerName)")
        
        //call segue .. 把 player 丟進對象 controller 去顯示
        //        performSegueWithIdentifier("segueToPlayer", sender: player)
        
        
    }
    
    // MARK: - 2.前往 新增成員
    func didAddPlayer() {
        self.performSegueWithIdentifier("AddPlayer", sender: nil)
    }
    
    
    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showEditTeam" {
            let destinationController = segue.destinationViewController as! AddTeamTableViewController
            
            destinationController.currentTeamIndex = String(self.number)
            destinationController.isAddTeam = false
            
        }
        else if  segue.identifier == "showAddTeam" {
            let destinationController = segue.destinationViewController as! AddTeamTableViewController
            
            destinationController.isAddTeam = true
            
        }else {
            // MARK: - 3.前往 新增成員畫面 傳 teamIndex
            let destinationController = segue.destinationViewController as! AddTeamMemberViewController
            destinationController.currentTeamIndex = String(self.number)
            
        }
        
        
    }
    
    //    func getToDestinationController() {
    //        let destinationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ForgetPasswordViewController")
    //        self.presentViewController(destinationController, animated: true, completion: nil)
    //    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToGameSetAction(sender: UIButton) {
        let destinationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GameSetTableViewController")
        self.navigationController?.pushViewController(destinationController, animated: true)
    }
    
    
}
//判斷滑到哪一頁的cell去控制它的編輯按鈕是否會出現
extension TeamViewController:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        self.number = Int(floor(scrollView.contentOffset.x / scrollView.frame.width))
        
        if number == teams.count {
            self.navigationItem.rightBarButtonItem = nil
        }else {
            self.navigationItem.rightBarButtonItem = editTeamButton
        }
    }
}
