//
//  LoginPage.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/3/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit
import SwiftyJSON
import FBSDKCoreKit
import FBSDKLoginKit

class LoginPage: BasicTableViewController, passwordCellDelegate, labelCellDelegate, buttonCellDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var registerButton: UIButton!
    
    let eachNumberOfRowInSection = [1,1,2,1]
    var account:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // table init
        self.headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height / 2.5)
        //self.footerView.frame = CGRect(x: 0, y:UIScreen.mainScreen().bounds.height * 9 / 10, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height / 10)
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "bg_login"))
        
        
        // cell register
        let buttonCellNib = UINib(nibName: "ButtonTableViewCell", bundle: nil)
        let labelCellNib = UINib(nibName: "AddTeamLabelTableViewCell", bundle: nil)
        let orCellNib = UINib(nibName: "OrTableViewCell", bundle: nil)
        let passwordCellNib = UINib(nibName: "PasswordTableViewCell", bundle: nil)
        
        self.tableView.registerNib(buttonCellNib, forCellReuseIdentifier: "buttonCell")
        self.tableView.registerNib(labelCellNib, forCellReuseIdentifier: "AddTeamLabelTableViewCell")
        self.tableView.registerNib(orCellNib, forCellReuseIdentifier: "orCell")
        self.tableView.registerNib(passwordCellNib, forCellReuseIdentifier: "PasswordTableViewCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerAction(sender: UIButton) {
        // api test
        
        //create team
// "place_name, 中山運動中心
//        addres,
//        lat,
//        lng,
//        name,
//        day, 星期二
//        start_time, 09:00
//        end_time,  20:00
//        logo, 圖片"
//        HttpManager.sharedInstance
//            .uploadDataWithImage(HttpMethod.HttpMethodPost, path: Params.apiRootPath + Params.apiCreateTeam ,
//                uploadImage: UIImage(named: "warrior")!,
//                param: ["auth_token":"1ErAQgxZgGuECRpYGTBU",
//                        "place_name":"中山運動中心test",
//                        "addres":"中山運動中心testAddress",
//                        "lat":"23.5",
//                        "lng":"33.5",
//                        "name":"teamOne",
//                        "day":"星期日",
//                        "start_time":"19:30",
//                        "end_time":"22:00"],
//                     success: { (code , data ) in
//                        self.success(code, data: data)
//                }, failure: { (code , data) in
//                    self.failure(code!, data: data!)
//                }, complete: nil)
        
        
        HttpManager.sharedInstance
            .request(HttpMethod.HttpMethodPatch,
                     apiFunc: APiFunction.UpdateTeam,
                     param: ["auth_token" : "1ErAQgxZgGuECRpYGTBU",
                             ":id":"9",
                            "place_name":"132中山運動中心test",
                            "addres":"123中山運動中心testAddress",
                            "lat":"55.5",
                            "lng":"55.5",
                            "name":"teamOne12",
                            "day":"123星期日",
                            "start_time":"19:30",
                            "end_time":"22:00"],
                     success: { (code , data ) in
                        self.success(code, data: data)
                }, failure: { (code , data) in
                        self.failure(code!, data: data!)
                }, complete: nil)
        
        //"auth_token" : "3NYxhnqFQVZqKAD5mAN5"
        
        //test account/password : ["email":"hello@test.co","password":"12345678"]
        //SaveGameScore
//        ["team_id": "9",
//            "game_type": "",
//            "scores[0]":"{'user' : 12, 'score' : 21, 'result' : W}",
//            "scores[1]":"{'user' : 13, 'score' : 18, 'result' : L}"]
        
    }
    
    func success(code:Int, data:JSON ) {
        print("\(#function)")
        print(code)
        print(data)
        let controller = UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("MainPageNavigationController")
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    func failure(code:Int, data:JSON ) {
        print("\(#function)")
        print(code)
        print(data)
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        print("validate : \(emailStr)")
        let emailRegEx = Params.emailReg
        let range = emailStr.rangeOfString(emailRegEx, options:.RegularExpressionSearch)
        return range != nil
    }
    
    func isValidpassword(passwordStr:String) -> Bool {
        print("validate : \(passwordStr)")
        let passwordRegEx = Params.passwordReg
        let range = passwordStr.rangeOfString(passwordRegEx, options:.RegularExpressionSearch)
        return range != nil
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eachNumberOfRowInSection[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Configure the cell...
        var reuseId = ""
        
        var cellReturn:UITableViewCell?
        
        
        switch indexPath.section {
        case 0 :
            reuseId = "buttonCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! ButtonTableViewCell
            cell.buttonInCell.setBackgroundImage(UIImage(named: "bn_login_3x"), forState: .Normal)
            cell.type = ButtonType.FBLogin
            cell.delegate = self
            cellReturn = cell
            
        case 2 :
            switch indexPath.row {
            case 0:
                reuseId = "AddTeamLabelTableViewCell"
                let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! AddTeamLabelTableViewCell
                cell.addTeamDetailText.textColor = UIColor.whiteColor()
                let placeholder = NSAttributedString(string: "信箱", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
                cell.addTeamDetailText.attributedPlaceholder = placeholder
                cell.addTeamDetailIcon.image = UIImage(named: "icon_field_account_mail_3x")
                cell.textFieldType = TextFieldType.Account
                cell.bottomLineView.backgroundColor = UIColor.whiteColor()
                cell.delegate = self
                cellReturn = cell
            default:
                reuseId = "PasswordTableViewCell"
                let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! PasswordTableViewCell
                cell.textFieldInCell.textColor = UIColor.whiteColor()
                let placeholder = NSAttributedString(string: "密碼", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
                cell.textFieldInCell.attributedPlaceholder = placeholder
                cell.iconImageView.image = UIImage(named: "ico_field_account_pwd_3x")
                cell.buttonInCell.setTitle("忘記密碼", forState: .Normal)
                cell.textFieldType = TextFieldType.Password
                cell.bottomLineView.backgroundColor = UIColor.whiteColor()
                cell.delegate = self
                cell.data = self
                cellReturn = cell
            }
        case 3 :
            reuseId = "buttonCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! ButtonTableViewCell
            cell.buttonInCell.setBackgroundImage(UIImage(named: "bn_account_login_normal_3x"), forState: .Normal)
            cell.type = ButtonType.ApiLogin
            cell.delegate = self
            cellReturn = cell
        default:
            reuseId = "orCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! OrTableViewCell
            cell.labelInCell.textColor = UIColor.whiteColor()
            
            cellReturn = cell
        }
        
        cellReturn?.backgroundColor = UIColor.clearColor()
        return cellReturn!
    }
    
    
    func getToDestinationController() {
        let destinationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ForgetPasswordViewController")
        self.presentViewController(destinationController, animated: true, completion: nil)
    }
    
    func getText(type: TextFieldType, enterText: String) {
        
        switch type {
        case .Account:
            self.account = enterText
        case .Password :
            self.password = enterText
        default :
            break
        }
    }
    
    func callPicker(sender:UITableViewCell, pickerContent: [String]) {
    }
    
    func buttonClick(buttonType: ButtonType) {
        
        switch buttonType {
        case .ApiLogin:
            // Api Login
            print(buttonType)
            print(self.account)
            print(self.password)
            
            if self.isValidEmail(self.account!) && self.isValidpassword(self.password!){
                // api check
                HttpManager.sharedInstance
                    .request(
                        HttpMethod.HttpMethodPost,
                        apiFunc: APiFunction.Login,
                        param: ["eamil": self.account!,
                                "password": self.password!],
                        success: { (code , data) in
                            self.success(code, data: data)
                        }, failure: { (code, data) in
                            self.failure(code!, data: data!)
                        }, complete: nil)
                
            }
        case .FBLogin:
            
            // test 
//            let controller = UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("MainPageNavigationController")
//            self.presentViewController(controller, animated: true, completion: nil)
            // FB Login
            print(buttonType)
            let facebookLogin = FBSDKLoginManager()
            
            facebookLogin.logInWithReadPermissions(["email"], fromViewController: self, handler: {
                (facebookresult, facebookError) -> Void in
                
                if facebookError != nil {
                    print("FaceBook login failed. Error: \(facebookError)")
                }else if facebookresult.isCancelled{
                    print("Facebook login was cancelled.")
                }else {
                    let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                    print(accessToken)
        
                    HttpManager.sharedInstance
                        .request(
                            HttpMethod.HttpMethodPost,
                            apiFunc: APiFunction.FBLogin,
                            param: ["access_token":accessToken],
                            success: { (code, data ) in
                                self.success(code, data: data)
                            }, failure: { (code, data) in
                                self.failure(code!, data: data!)
                            }, complete: nil)
                }
            })
        default :
            break
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
