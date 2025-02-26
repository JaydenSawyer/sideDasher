//
//  GameScene.swift
//  sideDasher
//
//  Created by JAYDEN SAWYER on 2/26/25.
//

import SpriteKit

import GameplayKit



class GameScene: SKScene {

    var ball: SKSpriteNode!

    let cam = SKCameraNode()

    

    

    override func didMove(to view: SKView) {

        self.camera = cam

        ball = (self.childNode(withName: "ball") as! SKSpriteNode)

    }

    

    override func update(_ currentTime: TimeInterval) {

        // Called before each frame is rendered

        cam.position.x =  ball.position.x + 300

    }

}
