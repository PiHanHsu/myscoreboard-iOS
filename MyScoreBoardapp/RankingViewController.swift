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
        cell.loseCount = 1
        cell.winCount = 4
        cell.winRate = CGFloat(80)
        cell.pointsAccumulation = 0
        cell.playerImage.image = UIImage(named: "ico_team_3x")
        cell.playerName.text = "abear"
        cell.RankNumberLabel.text = "1"
        
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
