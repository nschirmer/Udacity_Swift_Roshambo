//
//  RPSMatch.swift
//  Roshambo
//
//  Created by Nicholas Schirmer on 6/9/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import Foundation

// The RPSMatch struct stores the results of a match.
// Thanks to Jason from Udacity.


struct RPSMatch {
    
    let p1: RPS
    let p2: RPS
    
    init(p1: RPS, p2: RPS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    var winner: RPS {
        get {
            return p1.defeats(p2) ? p1 : p2
        }
    }
    
    var loser: RPS {
        get {
            return p1.defeats(p2) ? p2 : p1
        }
    }
}