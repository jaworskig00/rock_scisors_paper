//
//  Sign.swift
//  rock_scisors_paper
//
//  Created by Grzegorz Jaworski on 03/04/2019.
//  Copyright © 2019 Grzegorz Jaworski. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

func gameStateCheck(playerTurn: Sign, opponentTurn: Sign) -> GameState {
    
    if playerTurn.emoji == "" && opponentTurn.emoji == "" {
        return .start
    }
    else if playerTurn.emoji != opponentTurn.emoji {
        if (playerTurn.emoji == "✌🏼" && opponentTurn.emoji == "✋🏼") || (playerTurn.emoji == "👊🏼" && opponentTurn.emoji == "✌🏼") || (playerTurn.emoji == "✋🏼" && opponentTurn.emoji == "👊🏼") {
            return .win
        } else {
            return .lose
        }
    } else {
        return .draw
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
            case .rock: return "👊🏼"
            case .paper: return "✋🏼"
            case .scissors: return "✌🏼"
        }
    }
}
