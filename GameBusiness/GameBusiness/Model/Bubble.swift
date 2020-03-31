//
//  Buttons.swift
//  GameBusiness
//
//  Created by Kelvin Javorski Soares on 06/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Bubble : GameObject {
    
    var textures : [SKTexture] =   [SKTexture(imageNamed: "Bolha_Frame_1"),
                                    SKTexture(imageNamed: "Bolha_Frame_2"),
                                    SKTexture(imageNamed: "Bolha_Frame_3"),
                                    SKTexture(imageNamed: "Bolha_Frame_4"),
                                    SKTexture(imageNamed: "Bolha_Frame_5"),
                                    SKTexture(imageNamed: "Bolha_Frame_6"),
                                    SKTexture(imageNamed: "Bolha_Frame_7"),
                                    SKTexture(imageNamed: "Bolha_Frame_8"),
                                    SKTexture(imageNamed: "Bolha_Frame_9"),
    ]
    
    override func configurePhysics(){
        if let body = self.node.physicsBody{
            body.categoryBitMask = ContactMask.button.rawValue
            body.collisionBitMask = ContactMask.wall.rawValue
            body.contactTestBitMask = ContactMask.button.rawValue
            self.node.zPosition = 0
        }
        node.alpha = 0.5
    }
    
    func explodeBubble(){
        let action = SKAction.animate(with: textures, timePerFrame: 0.02)
        let resize = SKAction.scale(by: 3, duration: 0.5)
        
        self.node.run(action)
        self.node.run(resize)
//        self.node.run(action)
    }
    
//    var isClicked : Bool!
    
}
