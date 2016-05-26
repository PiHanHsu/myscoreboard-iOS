//
//  GameScoreViewController.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/6/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class GameScoreViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var redSidePicker: UIPickerView!
    @IBOutlet weak var blueSidePicker: UIPickerView!
    
    @IBOutlet weak var redTeamPlayerOne: UILabel!
    @IBOutlet weak var redTeamPlayerTwo: UILabel!
    @IBOutlet weak var blueTeamPlayerOne: UILabel!
    @IBOutlet weak var blueTeamPlayerTwo: UILabel!
    
    @IBOutlet weak var nextBluePlayerOne: UILabel!
    @IBOutlet weak var nextRedPlayerOne: UILabel!
    @IBOutlet weak var nextBluePlayerTwo: UILabel!
    @IBOutlet weak var nextRedPlayerTwo: UILabel!
    
    
    @IBOutlet weak var redTeamPlayerOneImage: UIImageView!
    @IBOutlet weak var redTeamPlayerTwoimage: UIImageView!
    @IBOutlet weak var blueTeamPlayerOneImage: UIImageView!
    @IBOutlet weak var blueTeamPlayerTwoImage: UIImageView!
    
    @IBOutlet weak var nextBlueTeamPlayerOneImage: UIImageView!
    @IBOutlet weak var nextRedTeamPlayerOneImage: UIImageView!
    @IBOutlet weak var nextRedTeamPlayerTwoImage: UIImageView!
    @IBOutlet weak var nextBlueTeamPlayerTwoImage: UIImageView!
    
    var pickerContent:[Int] = []
    var playSet:[[String:String]] = []
    var autoSet:[String:Int] = [:]
    var currentSetIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for player in Game.shareInstance.GamePlayers {
            self.autoSet[player.playerName!] = 0
        }
        Game.shareInstance.playerM = self.autoSet
        
        //data
        self.redTeamPlayerOne.text = "Steven"
        self.redTeamPlayerOneImage.image = UIImage(named: "Steven")
//                self.redTeamPlayerOneImage.layer.cornerRadius = self.redTeamPlayerOneImage.frame.size.width / 2
//                self.redTeamPlayerOneImage.clipsToBounds = true
        self.redTeamPlayerTwo.text = ""
        self.redTeamPlayerTwoimage.image = UIImage()
        //        self.redTeamPlayerTwoimage.layer.cornerRadius = self.redTeamPlayerTwoimage.frame.size.width / 2
        //        self.redTeamPlayerTwoimage.clipsToBounds = true
        self.blueTeamPlayerOne.text = "Damon"
        self.blueTeamPlayerOneImage.image = UIImage(named: "Damon")
        //        self.blueTeamPlayerOneImage.layer.cornerRadius = self.blueTeamPlayerOneImage.frame.size.width / 2
        //        self.blueTeamPlayerOneImage.clipsToBounds = true
        self.blueTeamPlayerTwo.text = ""
        self.blueTeamPlayerTwoImage.image = UIImage()
        //        self.blueTeamPlayerTwoImage.layer.cornerRadius = self.blueTeamPlayerTwoImage.frame.size.width / 2
        //        self.blueTeamPlayerTwoImage.clipsToBounds = true
        
        self.nextBluePlayerOne.text = "PiHan"
        self.nextBlueTeamPlayerOneImage.image = UIImage(named: "PiHan")
            
                self.nextBlueTeamPlayerOneImage.layer.cornerRadius = self.nextBlueTeamPlayerOneImage.frame.size.width / 2
                self.nextBlueTeamPlayerOneImage.clipsToBounds = true
        self.nextBluePlayerTwo.text = ""
        self.nextBlueTeamPlayerTwoImage.image = UIImage()
        //        self.nextBlueTeamPlayerTwoImage.layer.cornerRadius = self.nextBlueTeamPlayerTwoImage.frame.size.width / 2
        //        self.nextBlueTeamPlayerTwoImage.clipsToBounds = true
        self.nextRedPlayerOne.text = "Dyson"
        self.nextRedTeamPlayerOneImage.image = UIImage(named: "Dyson")
                self.nextRedTeamPlayerOneImage.layer.cornerRadius = self.nextRedTeamPlayerOneImage.frame.size.width / 2
                self.nextRedTeamPlayerOneImage.clipsToBounds = true
        self.nextRedPlayerTwo.text = ""
        self.nextRedTeamPlayerTwoImage.image = UIImage()
        //        self.nextRedTeamPlayerOneImage.layer.cornerRadius = self.nextRedTeamPlayerOneImage.frame.size.width / 2
        //        self.nextRedTeamPlayerOneImage.clipsToBounds = true
        
        self.playSet = [["player1":"Steven", "player2":"Damon"],["player1":"Dyson", "player2":"PiHan"],["player1":"Joyce", "player2":"Veronica"],["player1":"Dyson", "player2":"Damon"],["player1":"Steven", "player2":"Dyson"],["player1":"PiHan", "player2":"Steven"],["player1":"Damon", "player2":"PiHan"],["player1":"Veronica", "player2":"Joyce"],["player1":"Steph", "player2":"Joyce"],["player1":"", "player2":""]]
        
        
        self.blueSidePicker.dataSource = self
        self.blueSidePicker.delegate = self
        
        //self.redSidePicker
        self.redSidePicker.dataSource = self
        self.redSidePicker.delegate = self
        
        for i in 0...21 {
            self.pickerContent.append(i)
        }
        
        
        let rightItem = UIBarButtonItem()
        let backItem = UIBarButtonItem()
        rightItem.title = "今日紀錄"
        rightItem.target = self
        rightItem.action = #selector(self.getTodayRecord)
        backItem.title = "我的球隊"
        backItem.target = self
        backItem.action = #selector(self.backToGameSet)
        self.navigationItem.setLeftBarButtonItem(backItem, animated: true)
        self.navigationItem.setRightBarButtonItem(rightItem, animated: true)
        //self.navigationItem.leftBarButtonItem = backItem
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishGameAction(sender: UIButton) {
    
//        if self.currentSetIndex < self.playSet.count-1 {
//            self.currentSetIndex += 1
//            self.initPicker()
//            self.redTeamPlayerOne.text = self.playSet[self.currentSetIndex]["player1"]
//            self.redTeamPlayerTwo.text = ""
//            self.blueTeamPlayerOne.text = self.playSet[self.currentSetIndex]["player2"]
//            self.blueTeamPlayerTwo.text = ""
//            self.redTeamPlayerOneImage.image = UIImage(named: self.playSet[self.currentSetIndex]["player1"]!)
//            self.redTeamPlayerTwoimage.image = UIImage()
//            self.blueTeamPlayerOneImage.image = UIImage(named: self.playSet[self.currentSetIndex]["player2"]!)
//            self.blueTeamPlayerTwoImage.image = UIImage()
//            
//            if self.currentSetIndex+1 < self.playSet.count {
//                self.nextBluePlayerOne.text = self.playSet[self.currentSetIndex + 1]["player2"]
//                self.nextRedPlayerOne.text = self.playSet[self.currentSetIndex + 1]["player1"]
//                self.nextBluePlayerTwo.text = ""
//                self.nextRedPlayerTwo.text = ""
//                if self.playSet[self.currentSetIndex + 1]["player2"]! != "" {
//                    self.nextBlueTeamPlayerOneImage.image = UIImage(named: self.playSet[self.currentSetIndex + 1]["player2"]!)
//                    self.nextBlueTeamPlayerTwoImage.image = UIImage()
//                }else {
//                    self.nextBlueTeamPlayerOneImage.image = UIImage()
//                    self.nextBlueTeamPlayerTwoImage.image = UIImage()
//                }
//                
//                if self.playSet[self.currentSetIndex + 1]["player1"]! != "" {
//                    self.nextRedTeamPlayerOneImage.image = UIImage(named: self.playSet[self.currentSetIndex + 1]["player1"]!)
//                    self.nextRedTeamPlayerTwoImage.image = UIImage()
//                }else {
//                    self.nextRedTeamPlayerOneImage.image = UIImage()
//                    self.nextRedTeamPlayerTwoImage.image = UIImage()
//                }
//            }else {
//                
//            }
//        }else {
//            let list = Game.shareInstance.getGameplayer(self.autoSet, playerFemale: [:])
//            self.redTeamPlayerOne.text = list[0]
//            self.redTeamPlayerTwo.text = list[1]
//            self.blueTeamPlayerOne.text = list[2]
//            self.blueTeamPlayerTwo.text = list[3]
//        }
        
        let list = Game.shareInstance.getGameplayer()
        print(list)
        self.redTeamPlayerOne.text = list[0]
        self.redTeamPlayerTwo.text = list[1]
        self.blueTeamPlayerOne.text = list[2]
        self.blueTeamPlayerTwo.text = list[3]
        
    }
    
    func initPicker() {
        self.redSidePicker.selectRow(0, inComponent: 0, animated: true)
        self.blueSidePicker.selectRow(0, inComponent: 0, animated: true)
    }
    
    func getTodayRecord() {
        let destinationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TodayRankTableViewController")
        self.navigationController?.pushViewController(destinationController, animated: true)
    }
    
    func backToGameSet() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UIPickerViewDataSource
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerContent.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - UIPickerViewDelegate
    
    //    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        let titleData = String(self.pickerContent[row])
    //        let myTitle = NSAttributedString(string:titleData, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
    //        return String(myTitle)
    //    }
    //
    //    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    //        let titleData = String(self.pickerContent[row])
    //        let myTitle = NSAttributedString(string:titleData, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
    //        return myTitle
    //    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = String(self.pickerContent[row])
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Arial", size:pickerView.bounds.height * 8/10 )!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        pickerLabel.attributedText = myTitle
        pickerLabel.textAlignment = .Center
        pickerLabel.backgroundColor = UIColor.clearColor()
        return pickerLabel
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("end picker : \(self.pickerContent[row])")
        //self.selectedGender = pickerContent[row]
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return self.blueSidePicker.bounds.height
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
