//
//  Team.swift
//  MyScoreBoardapp
//
//  Created by stephanie yang on 2016/4/30.
//  Copyright © 2016年 PiHan Hsu. All rights reserved.
//

import Foundation
import SwiftyJSON
class Team: NSObject {
    
    var players = [Player]()
    var TeamImageUrl:String?
    var TeamName:String?
    var GameTimeDay:String?
    var GameTimeHour:String?
    var GameLocation:String?
    var TeamId:String?
    
    init(data:JSON) {
//        self.TeamImageUrl = data["team"]["logo_original_url"].stringValue
//        self.TeamName = data["team"]["name"].stringValue
//        self.GameTimeDay = data
//        self.GameTimeHour =
//        self.GameLocation = data["team"]["location"]["place_name"].stringValue
//        self.TeamId = data["team"]["id"].stringValue       
    }
    
    override init() {
        
    }
    
    
   }

