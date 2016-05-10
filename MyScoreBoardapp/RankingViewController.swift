//
//  RankingViewController.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/9/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var rankType: UISegmentedControl!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var rankingTableView: UITableView!
    
    @IBOutlet weak var teamNameBackgroundView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    var ranks:[Ranking] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rankingTableView.delegate = self
        self.rankingTableView.dataSource = self
        
        self.title = "排行榜"
        
        self.teamNameBackgroundView.layer.cornerRadius = 10
        self.rankingTableView.layer.cornerRadius = 10
        self.contentView.layer.cornerRadius = 10
        self.contentView.clipsToBounds = true
        
        self.rankType.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Normal)
        self.rankType.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Selected)
        
        self.rankingTableView.backgroundColor = UIColor(red: CGFloat(0)/255, green: CGFloat(19)/255, blue: CGFloat(49)/255, alpha: CGFloat(1))
        self.rankingTableView.separatorStyle = .None
        self.rankingTableView.allowsSelection = false
        
        let cellNib = UINib(nibName: "RankingTableViewCell", bundle: nil)
        self.rankingTableView.registerNib(cellNib, forCellReuseIdentifier: "RankingTableViewCell")
        
        
        //data
        let rank1 = Ranking()
        rank1.loseCount = 1
        rank1.winCount = 4
        rank1.RankNumber = "1"
        rank1.playerName = "PiHan"
        rank1.pointsAccumulation = 0
        rank1.playerImage = UIImage()
        rank1.winRate = CGFloat(rank1.winCount) / CGFloat(rank1.winCount + rank1.loseCount)
        let rank2 = Ranking()
        rank2.loseCount = 2
        rank2.winCount = 3
        rank2.RankNumber = "2"
        rank2.playerName = "Joyce"
        rank2.pointsAccumulation = 0
        rank2.playerImage = UIImage()
        rank2.winRate = CGFloat(rank2.winCount) / CGFloat(rank2.winCount + rank2.loseCount)
        let rank3 = Ranking()
        rank3.loseCount = 3
        rank3.winCount = 2
        rank3.RankNumber = "3"
        rank3.playerName = "Steven"
        rank3.pointsAccumulation = 0
        rank3.playerImage = UIImage()
        rank3.winRate = CGFloat(rank3.winCount) / CGFloat(rank3.winCount + rank3.loseCount)
        let rank4 = Ranking()
        rank4.loseCount = 4
        rank4.winCount = 1
        rank4.RankNumber = "4"
        rank4.playerName = "Damon"
        rank4.pointsAccumulation = 0
        rank4.playerImage = UIImage()
        rank4.winRate = CGFloat(rank4.winCount) / CGFloat(rank4.winCount + rank4.loseCount)
        let rank5 = Ranking()
        rank5.loseCount = 5
        rank5.winCount = 0
        rank5.RankNumber = "5"
        rank5.playerName = "Dyson"
        rank5.pointsAccumulation = 0
        rank5.playerImage = UIImage()
        rank5.winRate = CGFloat(rank5.winCount) / CGFloat(rank5.winCount + rank5.loseCount)
        self.ranks.append(rank1)
        self.ranks.append(rank2)
        self.ranks.append(rank3)
        self.ranks.append(rank4)
        self.ranks.append(rank5)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UITableViewDelegate
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RankingTableViewCell", forIndexPath: indexPath) as! RankingTableViewCell
        let rank = self.ranks[indexPath.row]
        cell.loseCount = rank.loseCount
        cell.winCount = rank.winCount
        cell.winRate = rank.winRate * 100
        cell.pointsAccumulation = 0
        cell.playerImage.image = UIImage(named: rank.playerName)
        cell.playerName.text = rank.playerName
        cell.RankNumberLabel.text = rank.RankNumber
        
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(UIScreen.mainScreen().bounds.height * 1/8 )
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
