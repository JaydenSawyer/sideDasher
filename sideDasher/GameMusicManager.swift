//
//  GameMusicManager.swift
//  sideDasher
//
//  Created by JAYDEN SAWYER on 3/12/25.
//

import Foundation
import SpriteKit

class GameMusicManager {
    var backgroundMusic: SKAudioNode?

    func playBackgroundMusic(filename: String) {
        if let musicURL = Bundle.main.url(forResource: filename, withExtension: nil) {
            backgroundMusic = SKAudioNode(url: musicURL)
            backgroundMusic?.autoplayLooped = true
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.addChild(backgroundMusic!)
            }
        }
    }

    func stopBackgroundMusic() {
        backgroundMusic?.run(SKAction.stop())
    }

    func pauseBackgroundMusic() {
        backgroundMusic?.run(SKAction.pause())
    }

    func resumeBackgroundMusic() {
        backgroundMusic?.run(SKAction.play())
    }
}
