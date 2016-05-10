//
//  MyTabBarViewController.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/10/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        print(self.viewControllers)
        self.viewControllers?.removeLast()
        
        let myTeamController = UIStoryboard(name: "Team", bundle: nil).instantiateViewControllerWithIdentifier("pageOneMyTeam")
        myTeamController.tabBarItem = UITabBarItem(title: "我的球隊", image: UIImage(named: "team"), tag: 0)
        
        self.viewControllers?.append(myTeamController)
        
        
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
