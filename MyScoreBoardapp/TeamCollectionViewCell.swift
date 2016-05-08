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
    func didAddPlayer()
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
//    @IBOutlet weak var lightBlueView: UIView!
    @IBOutlet weak var imageBackground: UIView!
    @IBOutlet weak var teamDetailBackground: UIView!
    @IBOutlet weak var headerBackground: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "PlayerCardCollectionViewCell", bundle: nil)
        childCollectionView?.registerNib(nib, forCellWithReuseIdentifier: "PlayerCardCollectionViewCell")
        
        self.childCollectionView.dataSource = self
        self.childCollectionView.delegate = self
        
        
//        self.lightBlueView.layer.cornerRadius = 10
        self.teamBackgroundView.layer.cornerRadius = 10
        self.imageBackground.layer.cornerRadius = 10
        self.teamBackgroundView.layer.cornerRadius = 10
        self.headerBackground.layer.cornerRadius = 10
        self.childCollectionView.layer.cornerRadius = 10

        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return team!.players.count + 1
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PlayerCardCollectionViewCell", forIndexPath: indexPath) as! PlayerCardCollectionViewCell
        if indexPath.item == 0 {
            cell.playerName.text = "新增成員"
            cell.playerImage.image = UIImage(named: "ico_member_add_3x")
            
        }else{
            
            let player = team!.players[indexPath.row-1]
            cell.playerName.text = player.playerName
            cell.playerImage.image = UIImage(named: player.playerImageUrl!)
            
            let size = (self.childCollectionView.frame.size.width)/3
            cell.playerImage.layer.cornerRadius = size / 2
        }
               
        return cell
    }
    
    //計算每個 Cell 的大小，大小會決定一排會呈現幾個 Cell
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let size = (self.childCollectionView.frame.size.width)/3
        return CGSize.init(width: size, height: size*1.25)
        
    }
    
    //計算 minimumInteritemSpacing 的間隔是多少
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    //計算 LineSpacing 的間隔是多少
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    //由此 collectionView delegate 得知某個 player 被點擊到
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        guard let controller = delegate else {
            print("unwrap failed")
            return;
        }
        

        //依據 indexPath 把被點擊到的 Player 資訊取出
        
        if indexPath.item == 0 {
            controller.didAddPlayer()
        }
        
        
        let player = team!.players[indexPath.row]
               //將此 Player 資訊透過 自己定義的 delegate 回傳到 controller
        controller.didSelectedChild(player)
        
    }
    
}

