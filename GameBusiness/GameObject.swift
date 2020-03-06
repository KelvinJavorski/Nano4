//
//  GameObject.swift
//  GameBusiness
//
//  Created by Kelvin Javorski Soares on 06/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class GameObject {
    internal init(scene: GameScene?, node: SKSpriteNode?) {
        self.scene = scene
        self.node = node
    }
    
    var scene: GameScene!
    var node: SKSpriteNode!
    
    func configurePhysics(){}
}
