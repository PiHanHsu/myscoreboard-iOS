//
//  MyTeamPage.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/4/21.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class MyTeamPage: UIViewController,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var playGameTime: UILabel!
    @IBOutlet weak var playGameLocation: UILabel!
    
    @IBOutlet weak var teamCollectionView: UICollectionView!
    @IBOutlet weak var teamLayout: UICollectionViewFlowLayout!
    
////    override func viewWillLayoutSubviews() {
//        <#code#>
//    }
    
    let teams = [[TeamDetail.teamimage:"warrior",TeamDetail.Name:"來打羽球囉",TeamDetail.time:"球聚時間：星期六 09:00",TeamDetail.location:"球聚地點：火星"]]
    
    let playerCards = [[PlayerCardDtail.name:"熊",PlayerCardDtail.photo:"player1"],[PlayerCardDtail.name:"David Chou",PlayerCardDtail.photo:"player2"],[PlayerCardDtail.name:"熊",PlayerCardDtail.photo:"player1"],[PlayerCardDtail.name:"David Chou",PlayerCardDtail.photo:"player2"],[PlayerCardDtail.name:"熊",PlayerCardDtail.photo:"player1"],[PlayerCardDtail.name:"David Chou",PlayerCardDtail.photo:"player2"],[PlayerCardDtail.name:"熊",PlayerCardDtail.photo:"player1"],[PlayerCardDtail.name:"David Chou",PlayerCardDtail.photo:"player2"],[PlayerCardDtail.name:"熊",PlayerCardDtail.photo:"player1"],[PlayerCardDtail.name:"David Chou",PlayerCardDtail.photo:"player2"],[PlayerCardDtail.name:"熊",PlayerCardDtail.photo:"player1"],[PlayerCardDtail.name:"David Chou",PlayerCardDtail.photo:"player2"],[PlayerCardDtail.name:"熊",PlayerCardDtail.photo:"player1"],[PlayerCardDtail.name:"David Chou",PlayerCardDtail.photo:"player2"],[PlayerCardDtail.name:"熊",PlayerCardDtail.photo:"player1"],[PlayerCardDtail.name:"David Chou",PlayerCardDtail.photo:"player2"],[PlayerCardDtail.name:"熊",PlayerCardDtail.photo:"player1"],[PlayerCardDtail.name:"David Chou",PlayerCardDtail.photo:"player2"]]
    
    
    private let PlayerCardreuseIdentifier = "PlayerCardCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.teamCollectionView.delegate = self
        self.teamCollectionView.dataSource = self
        
        
        
        
        
        self.teamImage.image = UIImage(named: self.teams[0][TeamDetail.teamimage]!)
        self.teamName.text = self.teams[0][TeamDetail.Name]
        self.playGameTime.text = self.teams[0][TeamDetail.time]
        self.playGameLocation.text = self.teams[0][TeamDetail.location]
        
        
        
//        print (self.teams[0][TeamDetail.teamimage]!)
        
        
        self.teamCollectionView.registerNib(UINib(nibName: "PlayerCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PlayerCardreuseIdentifier)
        
        self.teamLayout.itemSize = CGSize(width: (UIScreen.mainScreen().bounds.width)/4, height: (UIScreen.mainScreen().bounds.height)/4)
        
        self.view.viewWithTag(1)!.layer.cornerRadius = 10
        self.view.viewWithTag(1)!.layer.masksToBounds = true
        
      
        
        self.teamImage.layer.cornerRadius = 72
        self.teamImage.layer.masksToBounds = true
        
//    teamCollectionView裡面的xib想要圓角，圓角參數想隨
        self.teamCollectionView.viewWithTag(2)!.layer.cornerRadius = 10
        self.teamCollectionView.viewWithTag(2)!.layer.masksToBounds = true
        
        

        
        
//        let width = (UIScreen.mainScreen().bounds.width - 2*5)/4
     
        
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.playerCards.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(PlayerCardreuseIdentifier, forIndexPath: indexPath) as! PlayerCardCollectionViewCell
        
        let eachplaycard = playerCards[indexPath.item]
        
        
            
        cell.playerImage.image = UIImage(named: eachplaycard[PlayerCardDtail.photo]!)
        
        cell.playerImage.layer.cornerRadius = 10
        cell.playerImage.layer.masksToBounds = true

        
        
//        print(eachplaycard[PlayerCardDtail.photo])
        
        
        cell.playerName.text = eachplaycard[PlayerCardDtail.name]
       
    
        return cell
        
    }

    
}
