//
//  LoginPage.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 4/18/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginAction(sender: UIButton) {
        self.loginByBackEnd()
        let personalMainPage = storyboard?.instantiateViewControllerWithIdentifier("PersonalMainPage") as! PersonalMainPage
        self.presentViewController(personalMainPage, animated: true, completion: nil)
    }
    
    
    func checkAuthToken() {
        
    }
    
    func register() {
        
    }
    
    func loginByBackEnd() {
        let api_ip = "http://45.32.254.188/"
        let api_login_url = "/api/v1/login"
        let test_account = "hello@test.co"
        let test_password = "12345678"
        
        
        let url = api_ip + api_login_url
        Alamofire.request(.POST,
            url,
            parameters:
            [   "email": test_account,
                "password": test_password ])
            .responseJSON(completionHandler: {
                response in if let data = response.result.value{
                    let json = JSON(data)
                    //print(json)
                    print("user_id      :   \(json["user_id"])")
                    print("auth_token   :   \(json["auth_token"])")
                }
            })
    }
    
    func loginByFB() {
        
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
