//
//  GameViewController.swift
//  TorresJonathan_AdaptiveLayoutProyect
//
//  Created by Jonathan Torres on 12/3/16.
//  Copyright © 2016 Jonathan Torres. All rights reserved.
//

import UIKit
import GameplayKit

class GameViewController: UIViewController {

    //Set all UIElements and Collection Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet var cardImages: [UIImageView]!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet var cardViews: [UIView]!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    //Game's Timers
    @objc var miscSeconds = 0
    @objc var miscTimers = Timer()
    @objc var gameTimer = Timer()
    @objc var gameSeconds = 0
    @objc var gameMinutes = 0
    @objc var timerActive = false
    
    //Cards Arrays
    var gameArray: [(img: UIImage, id: Int )] = [(UIImage,Int)]()
    
    //Selected Cards in-game and game elements
    @objc var cardsPicked = Int()
    var firstCardId: (Int, Int) = (0,0)
    var secondCardId: (Int, Int) = (0,0)
    @objc var numberOfPairs = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Have an Empty array to fill with information from the "ImageData Class"
        var imageArray = NSArray()
        
        //If statement if tablet
        if UIDevice.current.userInterfaceIdiom == .pad{
        imageArray = ImagetData().tabletArray
            
        }
        // or tv
        else if UIDevice.current.userInterfaceIdiom == .tv{
            imageArray = ImagetData().tabletArray
        }
        //or Iphone
        else{
             imageArray = ImagetData().phoneArray
            
        }
        
        //Shuffle the array of cards        
       let shuffledArray = imageArray.shuffled() as! [(UIImage,Int)]
        
       //Set shuffled cards as the primary game cards
       gameArray = shuffledArray
        
        
        //Assign each image an icon
        for index in 0..<gameArray.count {
            cardImages[index].image = gameArray[index].img
        }
        
        //Count down Time
        miscSeconds = 5
        
        //Pre game Timer
        miscTimers = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.preGameTimer), userInfo: nil, repeats: true)
        
        restartButton.isEnabled = false
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function for the pre-game countdown
    @objc func preGameTimer(){
        
        miscSeconds -= 1
        
        //disbled the UserInteraction until for the countdown
        gameView.isUserInteractionEnabled = false
        
        //if the timer hits 0
        if miscSeconds == 0{
            
            //Hide the cards images
            for index in 0..<gameArray.count {
                cardImages[index].image = #imageLiteral(resourceName: "OptimaFontQuestionMark")
            }
            
            //stop the Timer and reset the counter
            miscTimers.invalidate()
            miscSeconds = 0
            
            //Enable the user to play the game after the countdown is over
            gameView.isUserInteractionEnabled = true
            restartButton.isEnabled = true
            
                gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.mainTimer), userInfo: nil, repeats: true)
            
        }
        
        //Change number in the label
        
        if miscSeconds == 0 {
            countDownLabel.text = "Go!"
        }
        else{
            countDownLabel.text = "\(miscSeconds)"
        }
        
        
        
    }
    
    //Function when a caed is pressed
    @IBAction func cardPressed(_ sender: UIButton) {
        
        //reveal the images to the user and register that card as "picked" to add to the "cardsPicked" counter
        cardImages[sender.tag].image = gameArray[sender.tag].img
        cardsPicked += 1
        restartButton.isEnabled = false
        
        //if only one cards is picked
        if cardsPicked == 1 {
        //record that card's ID and disable that button
        firstCardId.1 = gameArray[sender.tag].id
        firstCardId.0 = sender.tag
        cardButtons[sender.tag].isEnabled = false
            
        }
        //If two cards have been picked
        else if cardsPicked == 2{
        //record that card's ID
         secondCardId.1 = gameArray[sender.tag].id
         secondCardId.0 = sender.tag
            
            //if both cards ID matches
            if firstCardId.1 == secondCardId.1{
                //disable the user interaction so they can see the cards they have picked
                gameView.isUserInteractionEnabled = false
                //Run the "correctPair" function on a timer and reset the "pick" counter
                miscTimers = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.correctPair), userInfo: nil, repeats: false)
                cardsPicked = 0
                
            }
                //if both cards ID do not match
            else{
                //disable the user interaction so they can see the cards they have picked
                gameView.isUserInteractionEnabled = false

            //Run the "IncorrectPair" function on a timer.
            miscTimers = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(GameViewController.incorrectPair), userInfo: nil, repeats: false)
                

            }
            
        }

    }
    //function if the cards picked were a match
    @objc func correctPair(){
        
        //Hide both cards and add one confirmed pair on a counter
        cardViews[firstCardId.0].isHidden = true
        cardViews[secondCardId.0].isHidden = true
        numberOfPairs += 1
        
        //if the user has paired all cards
        if numberOfPairs == gameArray.count / 2 {
            gameTimer.invalidate()
            //display an UIAlert for acongratulations message. Then let him choose if he wants to restart or exit
            let alertController = UIAlertController(title: "You win!", message: "Your time \(countDownLabel.text!)", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Exit", style: UIAlertActionStyle.default) {
                UIAlertAction in
                
                self.performSegue(withIdentifier: "backToMain", sender: self)
                
                
            }
            let cancelAction = UIAlertAction(title: "Restart", style: UIAlertActionStyle.cancel) {
                UIAlertAction in
                self.restartBtn()
            }
            
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)

        }
        //reset the "picked" counter and enable UserInteraction
        cardsPicked = 0
        gameView.isUserInteractionEnabled = true
        restartButton.isEnabled = true
        
    }
    
    //function if the cards picked are not a match
    @objc func incorrectPair(){
        
        //hide the cards again and give the user control over the first card picked
            cardImages[firstCardId.0].image = #imageLiteral(resourceName: "OptimaFontQuestionMark")
            cardButtons[firstCardId.0].isEnabled = true
            cardImages[secondCardId.0].image = #imageLiteral(resourceName: "OptimaFontQuestionMark")
        //reset the "picked" counter, invalidate the timer and enable UserInteraction
            cardsPicked = 0
            miscTimers.invalidate()
            gameView.isUserInteractionEnabled = true
            restartButton.isEnabled = true
    }
    
    //Function if the user wants to exit the game and go back to the Main Menu
    @IBAction func exitBtn(){
        
        //Make a UIAlert warning the user that he is going to exit the game
        let alertController = UIAlertController(title: "Are you sure you want to Exit?", message: "You will have to start over again.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) {
            UIAlertAction in
            
             self.performSegue(withIdentifier: "backToMain", sender: self)
            
            
        }
        let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    //function to restart the game
    @IBAction func restartBtn(){
        
        //Reassign the positions of the cards
        for card in 0..<gameArray.count {
            cardViews[card].isHidden = false
            cardButtons[card].isEnabled = true
            
        }
        //restore timers and variables to default
        gameTimer.invalidate()
        gameSeconds = 0
        gameMinutes = 0
        numberOfPairs = 0
        miscSeconds = 5
        countDownLabel.text = "\(miscSeconds)"
        //recreate the DidLoad and WillAppear functions
        self.viewDidLoad()
        self.viewWillAppear(true)
    }
    
    //Fuction for the main game Timer
    @objc func mainTimer(){
        //add a second every run
        gameSeconds += 1
        
        //If statements that make a timer that can display minutes and seconds
        if gameSeconds < 10{
            countDownLabel.text = "\(gameMinutes):0\(gameSeconds)"
        }
        else if gameSeconds == 0{
            countDownLabel.text = "\(gameMinutes):00"
        }
        else{
            countDownLabel.text = "\(gameMinutes):\(gameSeconds)"
        }
        
        if gameSeconds == 59{
            gameSeconds = -1
            gameMinutes += 1
            
        }
        

        
    }
    

}




