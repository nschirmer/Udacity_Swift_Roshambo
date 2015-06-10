//
//  SelectMoveViewController.swift
//  Roshambo
//
//  Created by Nicholas Schirmer on 5/27/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import UIKit

class SelectMoveViewController: UIViewController {
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var viewHistoryButton: UIButton!
    
    var match: RPSMatch!
    var history = [RPSMatch]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        viewHistoryButton.hidden = history.count == 0
    }
    
    @IBAction func makeYourMove(sender: UIButton) {
        switch(sender) {
        case self.rockButton:
            throwDown(RPS.Rock)
        case self.paperButton:
            throwDown(RPS.Paper)
        case self.scissorsButton:
            throwDown(RPS.Scissors)
            
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    func throwDown(playersMove: RPS) {
        let computersMove = RPS()
        
        self.match = RPSMatch(p1: playersMove, p2: computersMove)
        
        history.append(match)
        
        if playersMove == RPS.Rock {
            var resultsController: ResultsViewController
            resultsController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
            
            resultsController.match = self.match
            
            self.presentViewController(resultsController, animated: true, completion: nil)
        }
        else if playersMove == RPS.Paper
        {
            performSegueWithIdentifier("throwDownPaper", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let controller = segue.destinationViewController as! ResultsViewController

        controller.match = self.match
    }
    
    @IBAction func showHistory(sender: AnyObject) {
        var historyController: ViewHistoryViewController
        historyController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewHistoryViewController") as! ViewHistoryViewController
        
        historyController.history = self.history
        self.showViewController(historyController, sender: self)
//        self.presentViewController(historyController, animated: true, completion: nil)
    }
}

