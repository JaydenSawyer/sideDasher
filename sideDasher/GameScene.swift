//
//  GameScene.swift
//  sideDasher
//
//  Created by JAYDEN SAWYER on 2/26/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var ball: SKSpriteNode!
    let cam = SKCameraNode()
    var death: SKSpriteNode!
    var gameMusicManager = GameMusicManager()
    var canJump = true
    var gameViewController: GameViewController?
    var level1End = 8640
    var deaths = 0

    override func didMove(to view: SKView) {
        self.camera = cam
        ball = (self.childNode(withName: "ball") as! SKSpriteNode)
        physicsWorld.contactDelegate = self
        death = (self.childNode(withName: "spike") as! SKSpriteNode)
        
        gameMusicManager.playBackgroundMusic(filename: "music.m4a")
    }
    
    func reset() {
        let action = SKAction.move(to: CGPoint(x: -571.837, y: 120.964), duration: 0)
        ball.run(action)
        ball.physicsBody?.velocity.dx = 375
        
        deaths += 1
        gameViewController?.deathOutlet.text = "Deaths: \(deaths)"
        gameViewController?.attempts += 1
        gameViewController?.attemptCounter.text = "Attempts: \(gameViewController?.attempts ?? 0)"
    }

    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "spike" {
            reset()
        } else if contact.bodyA.node?.name == "spike" && contact.bodyB.node?.name == "ball" {
            reset()
        }
        
        if (contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "block") ||
           (contact.bodyA.node?.name == "block" && contact.bodyB.node?.name == "ball") {
            canJump = true
        }
    }

    override func update(_ currentTime: TimeInterval) {
        cam.position.x = ball.position.x + 300
        
        if ball.physicsBody?.velocity.dy == 0 {
            canJump = true
        }
       
           
        }
    

    
    func jump() {
        if canJump {
            ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 425))
            canJump = false
        }
    }
}

