//
//  Game.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/7/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class Game {
    var TeamId:Int = 0
    var GamePlayers:[Player] = []
    var NumberOfGuestPlayer:Int = 0
    var GameMode:String = ""
    var playerM:[String:Int] = [:]
    var playerF:[String:Int] = [:]
    
    func haveJoinGame(inout playerList:[String:Int] , playerName:String) {
        playerList[playerName] = playerList[playerName]! + 1
    }
    
    func getGameplayer() -> [String] {
        let playerMan:[String:Int] = self.playerM
        let playerFemale:[String:Int] = self.playerF
        let playerArrayM = Array(playerMan).sort{$0.1 < $1.1}
        let playerArrayF = Array(playerFemale).sort{$0.1 < $1.1}
        
        var gamePlayer:[String] = []
        
        var doubleM = 0
        var doubleF = 0
        var mix = 0
        
        var i = 1
        
        //doubleM
        if playerArrayM.count >= 4 {
            for (_, value) in playerArrayM {
                if i <= 4 {
                    doubleM += value
                    i += 1
                }else {
                    break
                }
            }
            i = 1
        }else {
            doubleM = 100000000000000
        }
        
        //doubleF
        if playerArrayF.count >= 4 {
            for (_, value) in playerArrayF {
                if i <= 4 {
                    doubleF += value
                    i += 1
                }else {
                    break
                }
            }
            i = 1
        }else {
            doubleF = 100000000000000
        }
        
        //mix
        if playerArrayM.count >= 2 && playerArrayF.count >= 2 {
            for (_, value) in playerArrayM {
                if i <= 2 {
                    mix += value
                    i += 1
                }else {
                    break
                }
            }
            i = 1
            
            for (_, value) in playerArrayF {
                if i <= 2 {
                    mix += value
                    i += 1
                }else {
                    break
                }
            }
            i = 1
        }else {
            mix = 100000000000000
        }
        
        if mix <= doubleF && mix <= doubleM {
            //mix
            if playerArrayM.count >= 2 && playerArrayF.count >= 2 {
                for (key, _) in playerArrayM {
                    if i <= 2 {
                        gamePlayer.append(key)
                        haveJoinGame(&playerM, playerName: key)
                        i += 1
                    }else {
                        break
                    }
                }
                i = 1
                
                for (key, _) in playerArrayF {
                    if i <= 2 {
                        gamePlayer.append(key)
                        haveJoinGame(&playerF, playerName: key)
                        i += 1
                    }else {
                        break
                    }
                }
                i = 1
            }
        }else if doubleM <= mix && doubleM <= doubleF {
            //doubleM
            if playerArrayM.count >= 4 {
                for (key, _) in playerArrayM {
                    if i <= 4 {
                        gamePlayer.append(key)
                        haveJoinGame(&playerM, playerName: key)
                        i += 1
                    }else {
                        break
                    }
                }
                i = 1
            }
            
        }else {
            //doubleF
            if playerArrayF.count >= 4 {
                for (key, _) in playerArrayF {
                    if i <= 4 {
                        gamePlayer.append(key)
                        haveJoinGame(&playerF, playerName: key)
                        i += 1
                    }else {
                        break
                    }
                }
                i = 1
            }
        }
        
        return gamePlayer
    }
    
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