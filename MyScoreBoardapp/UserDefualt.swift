//
//  UserDefualt.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/6/24.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import Foundation

class Usersinfo: NSObject{
    
    var auth_token:String = ""
    var user_id:String = ""
    
    static let sharedInstance = Usersinfo()
}