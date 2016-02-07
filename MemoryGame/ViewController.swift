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
    var countDown : Int = 6
    var count : NSTimer?
    
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
    @IBOutlet weak var countDownTimer: UILabel!
    
    @IBAction func buttons(sender: AnyObject) {
    
        
        if let tempButton = sender as? UIButton {
            if tempButton.currentTitle == "" {
                tempButton.hidden = true
                
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
            }
        }
        
    @IBAction func startButton(sender: AnyObject) {
        showAllButtons()
        
        countDown = 6
        if count == nil {
            count = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        }
        updateTimer()
        
        if let currentGame = currentGame {
            currentGame.playAgain()
        } else {
            currentGame = CurrentGame()
            currentGame?.playAgain()
            startButton.hidden = true
            startButton.setTitle("Play Again!", forState: UIControlState.Normal)
        }
        
        showWinningCombination()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
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
    
    func showWinningCombination() {
        
        if let _ = currentGame {
            
            var tempArray = ["","","","","","","","",""]
            var digitsArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
            var x = 0
            for num in (currentGame!.winningCombination) {
                swap(&tempArray[Int(num)!], &digitsArray[x])
                x++
            }

            buttonOne.setTitle((String(Int(tempArray[0])! + 1)), forState: UIControlState.Normal)
            buttonTwo.setTitle((String(Int(tempArray[1])! + 1)), forState: UIControlState.Normal)
            buttonThree.setTitle((String(Int(tempArray[2])! + 1)), forState: UIControlState.Normal)
            buttonFour.setTitle((String(Int(tempArray[3])! + 1)), forState: UIControlState.Normal)
            buttonFive.setTitle((String(Int(tempArray[4])! + 1)), forState: UIControlState.Normal)
            buttonSix.setTitle((String(Int(tempArray[5])! + 1)), forState: UIControlState.Normal)
            buttonSeven.setTitle((String(Int(tempArray[6])! + 1)), forState: UIControlState.Normal)
            buttonEight.setTitle((String(Int(tempArray[7])! + 1)), forState: UIControlState.Normal)
            buttonNine.setTitle((String(Int(tempArray[8])! + 1)), forState: UIControlState.Normal)
        }
    }
    
    func removeButtonText() {
        buttonOne.setTitle("", forState: UIControlState.Normal)
        buttonTwo.setTitle("", forState: UIControlState.Normal)
        buttonThree.setTitle("", forState: UIControlState.Normal)
        buttonFour.setTitle("", forState: UIControlState.Normal)
        buttonFive.setTitle("", forState: UIControlState.Normal)
        buttonSix.setTitle("", forState: UIControlState.Normal)
        buttonSeven.setTitle("", forState: UIControlState.Normal)
        buttonEight.setTitle("", forState: UIControlState.Normal)
        buttonNine.setTitle("", forState: UIControlState.Normal)
    }
    
    func updateTimer() {
        if (countDown <= 0){
            removeButtonText()
            countDownTimer.text = "GO!"
        } else if (countDown >= 0) {
            countDownTimer.text = String(countDown)
            countDown--
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

