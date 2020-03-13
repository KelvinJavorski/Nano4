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
        let distance = finalPos - initialPos
        let angle = distance.y / distance.x
        
        
        print("angle =  \(1/(angle))")
        
        
//        let shape = SKShapeNode()
////        shape.path = UIBezierPath(arcCenter: initialPos, radius: CGFloat(1), startAngle: <#T##CGFloat#>, endAngle: <#T##CGFloat#>, clockwise: <#T##Bool#>)
//        shape.position = CGPoint(x: 0, y: 0)
//        shape.fillColor = UIColor.red
//        shape.strokeColor = UIColor.blue
//        shape.lineWidth = 10
//        self.scene.addChild(shape)
    }
    
    
}
