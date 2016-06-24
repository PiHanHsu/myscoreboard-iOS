//
//  AddTeamMemberViewController.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/5/2.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

protocol AddMemberDelegate {
    func addMemberChanged(newMember:String)
}

class AddTeamMemberViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var addMemberText: UITextField!
    @IBOutlet weak var showTeamMembertableView: UITableView!
    
    
    
    var team:Team?
    var currentTeamIndex = ""
    var delegate:AddMemberDelegate?
    var searchMemberList:[Player] = []
    var newplayer:Player?
    var newplayerId:String?
    var newplayerUrl:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showTeamMembertableView.rowHeight = UITableViewAutomaticDimension;
        self.showTeamMembertableView.estimatedRowHeight = 600.0
        
        
        //        ask Teams.sharedInstance 為什麼是放在27行
//        addMemberText.text = team?.TeamName
        
        //        let teams = Teams.sharedInstance
        //
        //        print(teams)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func saveBtn(sender: AnyObject) {
        //        delegate?.nameChanged(addMemberText.text!)
        
        
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func goBackTeam(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func searchMember(sender: AnyObject) {
        self.searchMemberList.removeAll()
//        self.showTeamMembertableView.deleteRowsAtIndexPaths(<#T##indexPaths: [NSIndexPath]##[NSIndexPath]#>, withRowAnimation: <#T##UITableViewRowAnimation#>)
        
        print("self.searchMemberList : \(self.searchMemberList)")
        self.showTeamMembertableView.reloadData()
        
        // 1.get text
        let searchMemberText = addMemberText.text!
        print(searchMemberText)
        // 2.call api
        
        HttpManager.sharedInstance.request(HttpMethod.HttpMethodGet,
                                           apiFunc: APiFunction.SearchUser,
                                           param: ["search" : searchMemberText ],
                                           success: { (code, data) in
                                            print("----------------")
                                            //            print(data)
                                            
                                            // show api result
                                            // get data
                                            
                                            for member in data["results"].arrayValue{
                                                
                                                //                                  print(member)
                                                print(123456789)
                                                let searchMember = Player()
                                                searchMember.playerId = member["id"].stringValue
                                                searchMember.playerImageUrl = member["photo"].stringValue
                                                searchMember.playerName = member["username"].stringValue
                                                
                                                self.searchMemberList.append(searchMember)
                                                
                                                print(searchMember.playerId)
                                                print(searchMember.playerName)
                                                
                                            }
                                            
                                            self.showTeamMembertableView.reloadData()
                                            //sleep(10)
                                            // reload
            }, failure: { (code, data) in
                //failure
                self.failure(code!, data: data!)
            }, complete: nil)
        
        
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
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMemberList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ShowTeamMemberTableViewCell") as! ShowTeamMemberTableViewCell
        
        cell.MemberName.text = searchMemberList[indexPath.row].playerName
        cell.MemberImage.sd_setImageWithURL(NSURL(string:searchMemberList[indexPath.row].playerImageUrl!))
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        print("0000000000000")
        //        print(searchMemberList[indexPath.row].playerName)
        self.addMemberText.text = searchMemberList[indexPath.row].playerName
        self.newplayerId = searchMemberList[indexPath.row].playerId
        self.newplayerUrl = searchMemberList[indexPath.row].playerImageUrl
        
        
        
    }
    
    
    
    // MARK: - 4. 選擇新增成員 且 新增資料
    @IBAction func saveTeamNameBtn(sender: AnyObject) {
        
        
        //儲存新增的成員
//        let newPlayer = Player()
        self.newplayer = Player()
        self.newplayer!.playerName = addMemberText.text
        self.newplayer!.playerId = newplayerId
        self.newplayer!.playerImageUrl = newplayerUrl
        print("^^^^^^^^^^^^")
        
//        print("playerId\(newplayerId)")
//        print("TeamId\(Int(self.currentTeamIndex))")
        //        print("playerUrl\(newplayerUrl)")
        
//        print("api params")
//        print(Usersinfo.sharedInstance.auth_token)
//        print(currentTeamIndex)
//        print(newplayer?.playerId)
        
        //        上傳至sever
        HttpManager.sharedInstance.request(HttpMethod.HttpMethodPatch,
                                           apiFunc: APiFunction.AddPlayersInTeam,
                                           param: ["auth_token" : Usersinfo.sharedInstance.auth_token,":id" : (team?.TeamId)!,
                                            "added_user_ids":[(newplayer?.playerId)!]],
                                           
                                      
                                           
                                           success: { (code, data) in
                                            
                                            print("\(code) \(data)")
                                            
                                            let alertController = UIAlertController(title: "更新成功", message: "", preferredStyle: .Alert)
                                            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                                            
                                            alertController.addAction(alertAction)
                                            self.presentViewController(alertController, animated: true, completion: nil)
                                            
                                            self.team!.players.append(self.newplayer!)
                                            
                                            
                                            
            }, failure: { (code, data) in
                //failure
                print("\(code) \(data)")
                self.failure(code!, data: data!)
            }, complete: nil)
        
        //self.dismissViewControllerAnimated(true, completion: nil)
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
