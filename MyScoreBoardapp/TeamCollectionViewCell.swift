//
//  TeamCollectionViewCell.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/4/30.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

protocol MyCollectionViewCellProtocal {
    func didSelectedChild(player:Player)
}


class TeamCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var delegate:MyCollectionViewCellProtocal?
    var team:Team?
    var players = [Player]()
    
    @IBOutlet weak var childCollectionView: UICollectionView!
    @IBOutlet weak var childPlayerCardLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var teamBackgroundView: UIView!
    @IBOutlet weak var teamImageUrl: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var gameTimeTitle: UILabel!
    @IBOutlet weak var gameTimeDay: UILabel!
    @IBOutlet weak var gameTimeHour: UILabel!
    @IBOutlet weak var gameLocationTitle: UILabel!
    @IBOutlet weak var gameLocation: UILabel!
    @IBOutlet weak var TeamMemberTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "PlayerCardCollectionViewCell", bundle: nil)
        childCollectionView?.registerNib(nib, forCellWithReuseIdentifier: "PlayerCardCollectionViewCell")
        
        
        
        //        var players = [Player]()
        
        //        let player1 = Player()
        //        player1.playerImageUrl = "player1"
        //        player1.playerName = "abear"
        //        players.append(player1)
        
        
        
        
        self.childCollectionView.dataSource = self
        self.childCollectionView.delegate = self
        
        //        if self.team != nil {
        //            self.teamNameLabel.text = self.team?.TeamName
        //            self.gameTimeHour.text =  self.team?.GameTimeHour
        //            self.gameTimeDay.text = self.team?.GameTimeDay
        //            self.gameLocation.text = self.team?.GameLocation
        //        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return team!.players.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PlayerCardCollectionViewCell", forIndexPath: indexPath) as! PlayerCardCollectionViewCell
        let player = team!.players[indexPath.row]
        
        cell.playerName.text = player.playerName
        cell.playerImage.image = UIImage(named: player.playerImageUrl!)
        
        return cell
    }
    
    //計算每個 Cell 的大小，大小會決定一排會呈現幾個 Cell
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let size = self.contentView.frame.size.width/4
        return CGSize.init(width: size, height: size*1.2)
    }
    
    //計算 minimumInteritemSpacing 的間隔是多少
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10.0
    }
    
    //計算 LineSpacing 的間隔是多少
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 20.0
    }
    
    //由此 collectionView delegate 得知某個 player 被點擊到
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //依據 indexPath 把被點擊到的 Player 資訊取出
        let player = team!.players[indexPath.row]
        
        guard let controller = delegate else {
            print("unwrap failed")
            return;
        }
        
        //將此 Player 資訊透過 自己定義的 delegate 回傳到 controller
        controller.didSelectedChild(player)
        
    }
    
}
