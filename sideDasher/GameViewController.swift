//
//  GameViewController.swift
//  sideDasher
//
//  Created by JAYDEN SAWYER on 2/26/25.
//

import UIKit

import SpriteKit

import GameplayKit



class GameViewController: UIViewController {
    @IBOutlet weak var attemptCounter: UILabel!
    @IBOutlet weak var deathOutlet: UILabel!
    var play: GameScene!
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // getting a refrance to game scene.
                play = scene as? GameScene
                
                // Present the scene
                view.presentScene(scene)
                
            }
            
            
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
        }
        
    }
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func jump(_ sender: UIButton) {
        print("it works ")
        play.ball.physicsBody?.velocity.dy = 1000
        
    }
    

    
    
}
