//
//  level2.swift
//  sideDasher
//
//  Created by JAYDEN SAWYER on 3/31/25.
//

import Foundation
import SpriteKit

class NextLevelScene: SKScene, SKPhysicsContactDelegate {
    override func didMove(to view: SKView) {
        var ball: SKSpriteNode!
        let cam = SKCameraNode()
        var death: SKSpriteNode!
        var canJump = true
        var gameViewController: GameViewController?
        var level2End = 13200
        var deaths = 0
        
        func didMove(to view: SKView) {
            self.camera = cam
            ball = (self.childNode(withName: "ball") as! SKSpriteNode)
            physicsWorld.contactDelegate = self
            death = (self.childNode(withName: "spike") as! SKSpriteNode)
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
        
        func update(_ currentTime: TimeInterval) {
            cam.position.x = ball.position.x + 300
            
            if ball.physicsBody?.velocity.dy == 0 {
                canJump = true
            }
            if Int (ball.position.x) >= level2End {
                goToNextLevel()
            }
            
            
            
            func goToNextLevel() {
                if let view = self.view {
                    if let scene = SKScene(fileNamed: "Level3") {
                        scene.scaleMode = .aspectFill
                        if let gameScene = scene as? GameScene {
                            gameScene.gameViewController = gameViewController
                            gameViewController?.play = gameScene
                        }
                        let transition = SKTransition.fade(withDuration: 1.0)
                        view.presentScene(scene, transition: transition)
                    }
                }
            }
            
        }
        
        func jump() {
            if canJump {
                print("Does this work")
                ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 425))
                canJump = false
            }
        }
    }

    }

