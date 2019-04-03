//
//  GameState.swift
//  rock_scisors_paper
//
//  Created by Grzegorz Jaworski on 03/04/2019.
//  Copyright © 2019 Grzegorz Jaworski. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var string:String {
        switch self {
            case .start: return "Rock, Paper, Scissors?"
            case .win: return "You win!"
            case .lose: return "You lose!"
            case .draw: return "Draw!"
        }
    }
}
