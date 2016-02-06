//
//  ViewController.swift
//  MemoryGame
//
//  Created by Jonathan Oh on 2/5/16.
//  Copyright © 2016 Jonathan Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let currentGame = CurrentGame()
    
    @IBAction func buttons(sender: AnyObject) {
        
        //sender.hidden = true
        
        if currentGame.winningCombination.isEmpty {
            currentGame.generateWinningCombination(currentGame.gameBoardSize)
        }
        
        currentGame.addToPlayerCombination(sender.tag)
        print(currentGame.playerCombination)
        
        if currentGame.playerCombination.count == currentGame.winningCombination.count {
            if currentGame.didPlayerWin() {
                print("YOU WON!!")
            } else {
                print("You LOSE!")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        currentGame.generateWinningCombination(currentGame.gameBoardSize)
        print(currentGame.winningCombination)
        
    }

    @IBAction func testButton(sender: AnyObject) {
        
        //let currentGame = CurrentGame()
        
        currentGame.generateWinningCombination(currentGame.gameBoardSize)
        print(currentGame.winningCombination)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

