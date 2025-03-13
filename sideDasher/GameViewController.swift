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
    var attempts = 1
    var deaths = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        if let view = self.view as! SKView? {
            
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                play = scene as? GameScene
                
                
                play.gameViewController = self
                
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
        print("Jump button pressed")
        play.jump()
    }
    
}
