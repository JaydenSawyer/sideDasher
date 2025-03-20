//
//  GameScene.swift
//  sideDasher
//
//  Created by JAYDEN SAWYER on 2/26/25.
//

import SpriteKit
import GameplayKit

class HomeScreen: SKScene {
    var playButton: Button!
    var settingsButton: Button!
    
    var gvc: GameViewController!
       
    override func didMove(to view: SKView) {
        playButton = Button(imageNamed: "play_button")
        playButton.name = "playButton"
        playButton.position = CGPoint(x: -12.608, y: 62.188)
        playButton.action = {
            print("Play button tapped")
            let gameScene = GameScene(fileNamed: "GameScene")!
            gameScene.gameViewController = self.gvc
            self.gvc.play = gameScene
            self.gvc.presentScene(named: "GameScene")
        }
        
        self.addChild(playButton)
        
        
        settingsButton = Button(imageNamed: "settingsButton")
        settingsButton.name = "settingsButton"
        settingsButton.position = CGPoint(x: -16, y: -214)
        settingsButton.action = {
            print("Settings button tapped")
            self.gvc.presentScene(named: "Settings")
        }
        
        
        self.addChild(settingsButton)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        for touch in touches {
            let location = touch.location(in: self)
            if let node = self.atPoint(location) as? Button {
                node.touchesBegan(touches, with: event)
            }
        }
    }
}
