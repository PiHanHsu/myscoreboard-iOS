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
import SDWebImage

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
        
//        self.recordScoreButton.layer.cornerRadius = 10
//        recordScoreButton.imageView?.contentMode = .ScaleAspectFit
//        recordScoreButton.setBackgroundImage(UIImage(named: "bn_team_gotocounter_normal_3x"), forState: .Normal)
        
        HttpManager.sharedInstance
            .request(HttpMethod.HttpMethodGet,
                     apiFunc: APiFunction.GetTeamList,
                     param: ["auth_token" : "PVP6V6EZbzq6WMV7eX1z",
                        ":user_id":"25"],
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
        print("\(heightSize)")
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
//            myCell.teamImageUrl.sd_setImageWithURL(NSURL(string: Teams.sharedInstance.teams[indexPath.row].TeamImageUrl!))
            
            myCell.teamNameLabel.text = Teams.sharedInstance.teams[indexPath.row].TeamName
            myCell.gameTimeDay.text = Teams.sharedInstance.teams[indexPath.row].GameTimeDay
            myCell.gameTimeHour.text = Teams.sharedInstance.teams[indexPath.row].GameTimeHour
            myCell.gameLocation.text = Teams.sharedInstance.teams[indexPath.row].GameLocation
            myCell.players = Teams.sharedInstance.teams[indexPath.row].players
            
            
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
        if number == teams.count{
            performSegueWithIdentifier("showAddTeam", sender: self)
        }
        //增加一個新的球隊
        
    }
    
    //Delegate 方法，取得 TeamCollectionViewCell 中的 PlayerCardCollectionViewCell 被選擇的 Player 資訊
    func didSelectedChild(player:Player) {
        print("player name: \(player.playerName)")
        
    }
    
    // MARK: - 2.前往 新增成員
    func didAddPlayer() {
        self.performSegueWithIdentifier("AddPlayer", sender: nil)
    }

    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showEditAddTeam" {
            let destinationController = segue.destinationViewController as! AddTeamTableViewController
            
            destinationController.currentTeamIndex = String(self.number)
            destinationController.isAddTeam = false
//            print("number: \(self.number)")
//            print("team name: \(Teams.sharedInstance.teams[self.number].TeamName!)")
            destinationController.TeamName = Teams.sharedInstance.teams[self.number].TeamName!
            destinationController.totalTime = (Teams.sharedInstance.teams[self.number].GameTimeDay!+Teams.sharedInstance.teams[self.number].GameTimeHour!)
            
            destinationController.imageName = Teams.sharedInstance.teams[self.number].TeamImageUrl
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
