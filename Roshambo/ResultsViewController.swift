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

    
    
    @IBOutlet weak var resultImg: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = match.outcome
        resultImg.image = UIImage(named: match.isTie ? match.tie.imageName : match.winner.imageName)
    }
    
    @IBAction func playAgain() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
