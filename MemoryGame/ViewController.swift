//
//  ViewController.swift
//  MemoryGame
//
//  Created by Jonathan Oh on 2/5/16.
//  Copyright © 2016 Jonathan Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentGame : CurrentGame?
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var currentScore: UILabel!
    
    @IBAction func buttons(sender: AnyObject) {
        
        if let tempButton = sender as? UIButton {
            tempButton.hidden = true
        }
        
        if let currentGame = currentGame {
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
                currentScore.text = "Score : \(currentGame.currentScore)"
                startButton.hidden = false
            }
        }
    }
    
    @IBAction func startButton(sender: AnyObject) {
        showAllButtons()
        if let currentGame = currentGame {
            currentGame.playAgain()
        } else {
            currentGame = CurrentGame()
            startButton.hidden = true
            startButton.setTitle("Play Again!", forState: UIControlState.Normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
//        currentGame.generateWinningCombination(currentGame.gameBoardSize)
//        print(currentGame.winningCombination)
        
    }

    func showAllButtons() {
        buttonOne.hidden = false
        buttonTwo.hidden = false
        buttonThree.hidden = false
        buttonFour.hidden = false
        buttonFive.hidden = false
        buttonSix.hidden = false
        buttonSeven.hidden = false
        buttonEight.hidden = false
        buttonNine.hidden = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

