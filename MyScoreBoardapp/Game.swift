//
//  Game.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/7/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import Foundation

class Game {
    var TeamId:Int?
    var GamePlayers:[Player]?
    var NumberOfGuestPlayer:Int?
    var GameMode:String?
    
    static let shareInstance = Game()
}
