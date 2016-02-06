//
//  CurrentGame.swift
//  MemoryGame
//
//  Created by Jonathan Oh on 2/5/16.
//  Copyright © 2016 Jonathan Oh. All rights reserved.
//

import Foundation

class CurrentGame {
    
    //Properties
    private var _winningCombination : [String] = []
    private var _playerCombination : [String] = []
    private var _gameBoardSize : Int = 8
    
    var winningCombination : [String] {
        get {
            return _winningCombination
        }
    }
    var playerCombination : [String] {
        get {
            return _playerCombination
        }
    }
    var gameBoardSize : Int {
        get {
            return _gameBoardSize
        }
    }
    
    //Functions
    
    func generateWinningCombination(gameBoardSize : Int) {
        _winningCombination = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
        var maxIndex =  gameBoardSize
        
        //This loop will shuffle _winningCombination
        for _ in 0...gameBoardSize {
            let randomNum = arc4random_uniform(UInt32(maxIndex + 1))
            if Int(randomNum) == maxIndex && maxIndex == 0 {
                break
            } else if Int(randomNum) == maxIndex {
                maxIndex -= 1
                continue
            } else {
                swap(&_winningCombination[Int(randomNum)], &_winningCombination[Int(maxIndex)])
                maxIndex -= 1
            }
        }
    }
    
    func addToPlayerCombination(buttonTag : Int) {
        _playerCombination.append(String(buttonTag))
    }
    
    //Display Winning combination
    //Player's turn, which also hides winning combination
    
    //When button pressed
//    func playerPressedSquare(buttonTag : String) {
//        if _winningCombination.isEmpty {
//            self.generateWinningCombination(gameBoardSize)
//        }
//        
//        _playerCombination.append(buttonTag)
//        
//        if _playerCombination.count == _winningCombination.count {
//            self.didPlayerWin()
//        }
//    }
    
    func didPlayerWin() -> Bool {
        if _playerCombination == _winningCombination {
            return true
        } else {
            return false
        }
    }
    
    //Amount of time player has to memeorize (Countdown timer)
    
    //Play Button
    
    //Reset Board
    
}