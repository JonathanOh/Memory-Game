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
    private var _currentScore : Int = 0
    
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
    var currentScore : Int {
        get {
            return _currentScore
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
    
    func didPlayerWin() -> Bool {
        if _playerCombination == _winningCombination {
            _currentScore++
            return true
        } else {
            _currentScore = 0
            return false
        }
    }
    
    //Play Button
    func playAgain() {
        _playerCombination = []
        self.generateWinningCombination(gameBoardSize)
        print(winningCombination)
    }
    
    
    //Reset Board
    
}