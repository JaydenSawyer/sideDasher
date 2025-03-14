//
//  buttons.swift
//  sideDasher
//
//  Created by JAYDEN SAWYER on 3/14/25.
//

import Foundation
import SpriteKit

class Button: SKSpriteNode {
    var action: () -> Void = {}

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = true
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        action()
    }
}
