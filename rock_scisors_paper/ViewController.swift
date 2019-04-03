//
//  ViewController.swift
//  rock_scisors_paper
//
//  Created by Grzegorz Jaworski on 03/04/2019.
//  Copyright © 2019 Grzegorz Jaworski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func rockButttonTapped(_ sender: Any) {
        let sign: Sign = .rock
        play(sign)
    }
    
    @IBAction func paperButtonTapped(_ sender: Any) {
        let sign: Sign = .paper
        play(sign)
    }
    
    @IBAction func scissorsButtonTapped(_ sender: Any) {
        let sign: Sign = .scissors
        play(sign)
    }
    
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        updateUI(.start)
    }
    
    func updateUI(_ gameState: GameState) {
        if gameState == .start {
            appSign.text = "🤖"
            statusLabel.text = gameState.string
            view.backgroundColor = .gray
            
            playAgainButton.isHidden = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        } else if gameState == .win {
            statusLabel.text = gameState.string
            view.backgroundColor = .green
        } else if gameState == .lose {
            statusLabel.text = gameState.string
            view.backgroundColor = .red
        } else {
            statusLabel.text = gameState.string
            view.backgroundColor = .blue
        }
    }
    
    func play(_ sign: Sign) {
        let opponentSign = randomSign()
        let playerSign = sign
        let state = gameStateCheck(playerTurn: playerSign, opponentTurn: opponentSign)
        
        appSign.text = opponentSign.emoji
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        if playerSign != .rock {
            rockButton.isHidden = true
        }
        
        if playerSign != .paper {
            paperButton.isHidden = true
        }
        
        if playerSign != .scissors {
            scissorsButton.isHidden = true
        }
        
        playAgainButton.isHidden = false
        
        updateUI(state)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(.start)
    }


}

