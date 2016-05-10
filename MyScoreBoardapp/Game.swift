//
//  Game.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/7/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class Game {
    var TeamId:Int?
    var GamePlayers:[Player]?
    var NumberOfGuestPlayer:Int?
    var GameMode:String?
    
    static let shareInstance = Game()
}

class Score {
    static let shareInstance = Score()
    
    var redTeamPlayerOne = ""
    var redTeamPlayerTwo = ""
    var blueTeamPlayerOne = ""
    var blueTeamPlayerTwo = ""
    var redTeamScore = 0
    var blueTeamScore = 0
    
}


class Scores {
    var score:[Score] = []
}

class Ranking {
    var loseCount = 0
    var winCount = 0
    var winRate = CGFloat(0)
    var pointsAccumulation = 0
    var playerImage = UIImage()
    var playerName = ""
    var RankNumber = "0"
}