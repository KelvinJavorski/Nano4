//
//  Event.swift
//  GameBusiness
//
//  Created by Kelvin Javorski Soares on 11/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Event{
    internal init(scene: GameScene?, initialPos: CGPoint?, finalPos: CGPoint?, height: CGFloat?) {
        self.scene = scene
        self.initialPos = initialPos
        self.finalPos = finalPos
        self.height = height
    }    
    
    var scene: GameScene!
    var node : SKShapeNode = SKShapeNode()
    var initialPos: CGPoint!
    var finalPos: CGPoint!
    var height: CGFloat!
    
    func createBody(initBubble: Bubble, finalBubble: Bubble){
        self.initialPos = initBubble.node.position
        self.finalPos = finalBubble.node.position
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: CGRect(x: self.initialPos.x, y: self.initialPos.y, width: 150, height: 150), cornerRadius: 1).cgPath
        shape.position = CGPoint(x: 0, y: 0)
        shape.fillColor = UIColor.red
        shape.strokeColor = UIColor.blue
        shape.lineWidth = 10
        self.scene.addChild(shape)
    }
    
    
}
