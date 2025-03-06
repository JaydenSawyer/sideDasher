//
//  GameScene.swift
//  sideDasher
//
//  Created by JAYDEN SAWYER on 2/26/25.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene, SKPhysicsContactDelegate{
    var ball: SKSpriteNode!
    let cam = SKCameraNode()
    var death: SKSpriteNode!
    var backgroundMusic: SKAudioNode



    override func didMove(to view: SKView) {
        self.camera = cam
        ball = (self.childNode(withName: "ball") as! SKSpriteNode)
        physicsWorld.contactDelegate = self
        death = (self.childNode(withName: "spike") as! SKSpriteNode)
        
    }
    
    func reset() {
        var action = SKAction.move(to: CGPoint(x: -571.837, y: 120.964 ), duration: 0)
        ball.run(action)
        print("ball reset??")
        ball.physicsBody?.velocity.dx = 375
    }

    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "spike" {
            reset()
            print("collision happened")
        } else if contact.bodyA.node?.name == "spike" && contact.bodyB.node?.name == "ball"{
            reset()
            print("collision happened")
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        cam.position.x =  ball.position.x + 300

    }
    
}
