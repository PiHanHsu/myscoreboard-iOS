//
//  AddTeamPage.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/4/24.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class AddTeamPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.viewWithTag(1)!.layer.cornerRadius = 10
        self.view.viewWithTag(1)!.layer.masksToBounds = true
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
