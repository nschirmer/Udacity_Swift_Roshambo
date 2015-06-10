//
//  RPS.swift
//  Roshambo
//
//  Created by Nicholas Schirmer on 6/9/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import Foundation

// The RPS enum represents a move.
// Thanks to Jason from Udacity

enum RPS {
    case Rock, Paper, Scissors, Tie
    
    init() {
        switch arc4random() % 3 {
        
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        default:
            self = .Scissors
        }
    }
    
    func defeats(opponent: RPS) -> Bool {
        switch (self, opponent) {
        case (.Paper, .Rock), (.Scissors, .Paper), (.Rock, .Scissors):
            return true;
        default:
            return false;
        }
    }
}

extension RPS: Printable {
    var description: String {
        get {
            switch(self) {
            case .Rock:
                return "Rock"
            case .Paper:
                return "Paper"
            case .Scissors:
                return "Scissors"
            case .Tie:
                return "Tie"
            }
        }
    }
}