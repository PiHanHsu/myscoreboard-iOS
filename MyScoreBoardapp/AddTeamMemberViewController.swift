//
//  AddTeamMemberViewController.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/5/2.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

protocol AddMemberDelegate {
    func addMemberChanged(newMember:String)
}

class AddTeamMemberViewController: UIViewController {
    @IBOutlet weak var addMemberText: UITextField!
    
    var team:Team?
    var currentTeamIndex = ""
    var delegate:AddMemberDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ask Teams.sharedInstance 為什麼是放在27行
        addMemberText.text = team?.TeamName
        
        let teams = Teams.sharedInstance
        
        print(teams)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 4. 選擇新增成員 且 新增資料
    @IBAction func saveTeamNameBtn(sender: AnyObject) {
        //  給假資料
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
        

        //儲存新增的成員
        var newPlayer = Player()
        newPlayer = player5
        Teams.sharedInstance.teams[Int(self.currentTeamIndex)!].players.append(newPlayer)
        
        //self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    @IBAction func saveBtn(sender: AnyObject) {
        //delegate?.nameChanged(addMemberText.text!)
        
        
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func goBackTeam(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        
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
