//
//  buttons.swift
//  sideDasher
//
//  Created by JAYDEN SAWYER on 3/14/25.
//

import SpriteKit

class Button: SKSpriteNode {
    var action: (() -> Void)?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        action?()
    }
}
