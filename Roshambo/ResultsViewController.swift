//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Nicholas Schirmer on 5/27/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var match: RPSMatch!

    let victoryString: [RPS: String] = [
        RPS.Rock: "crushes",
        RPS.Scissors: "cuts",
        RPS.Paper: "covers"
    ]
    
    let matchImage: [RPS: String] = [
        RPS.Rock: "rockWins",
        RPS.Scissors: "scissorsWins",
        RPS.Paper: "paperWins",
        RPS.Tie: "tieWins"
    ]
    
    @IBOutlet weak var resultImg: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if match.winner == match.loser
        {
            resultLabel.text = "You tied!"
            resultImg.image = UIImage(named: matchImage[RPS.Tie]!)
        }
        else
        {
            resultLabel.text = "\(match.winner.description) \(victoryString[match.winner]!) \(match.loser.description). You " +
            (match.p1.defeats(match.p2) ? "Win!" : "Lose!")

            resultImg.image = UIImage(named: matchImage[match.winner]!)
        }
    }
    
    @IBAction func playAgain() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
