//
//  Buttons.swift
//  GameBusiness
//
//  Created by Kelvin Javorski Soares on 06/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Buttons : GameObject {
//    override init(isClicked: Bool?) {
//        super.init(scene: GameScene, node: SKSpriteNode(imageNamed: "coin"))
//        self.isClicked = isClicked
//
//    }
    
    override func configurePhysics(){
        if let body = self.node.physicsBody{
            body.categoryBitMask = ContactMask.button.rawValue
            body.collisionBitMask = ContactMask.wall.rawValue
            body.contactTestBitMask = ContactMask.button.rawValue
        }
    }
    
//    var isClicked : Bool!
    
}
