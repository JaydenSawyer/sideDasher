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
        
        
        presentHomeScreen()
        
        if let view = self.view as! SKView? {
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    func presentHomeScreen() {
        if let view = self.view as! SKView? {
            if let scene = HomeScreen(fileNamed: "HomeScreen") {
                scene.scaleMode = .aspectFill
                scene.gvc = self
                view.presentScene(scene)
            }
        }
    }
    
    func presentScene(named sceneName: String) {
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: sceneName) {
                scene.scaleMode = .aspectFill
                if let gameScene = scene as? GameScene {
                    gameScene.gameViewController = self
                    self.play = gameScene
                }
                view.presentScene(scene)
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func jumpButton(_ sender: Any) {
        print("Jump button pressed")
        if let play = play {
            play.jump()
        }
    }
}
