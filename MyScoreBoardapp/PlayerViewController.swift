//
//  PlayerViewController.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/4/30.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var player:Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interfaceInitial()
        
        // Do any additional setup after loading the view.
    }
    
    func interfaceInitial() {
        
        //使用 Player 變數來設定畫面
        
        //假如未拿到全部的 Player 資訊則會透過 API 向伺服器索取
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
