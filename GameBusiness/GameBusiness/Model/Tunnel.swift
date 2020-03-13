//
//  Event.swift
//  GameBusiness
//
//  Created by Kelvin Javorski Soares on 11/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Tunnel{
    internal init(scene: GameScene?, firstBubble: Bubble, lastBubble: Bubble) {
        self.scene = scene
        self.firstBubble = firstBubble
        self.lastBubble = lastBubble
        initialPos = firstBubble.node.position
        finalPos = lastBubble.node.position
    }
    
    var firstBubble: Bubble
    var lastBubble: Bubble
    var scene: GameScene!
    var circle: SKShapeNode = SKShapeNode()
    var node : SKShapeNode = SKShapeNode()
    var initialPos: CGPoint!
    var finalPos: CGPoint!
    var tunnelNode: SKShapeNode!
    var interval: TimeInterval!
    
    func createTunnel(initBubble: Bubble, finalBubble: Bubble){
        
        self.initialPos = initBubble.node.position
        self.finalPos = finalBubble.node.position
        let path = CGMutablePath()
        path.move(to: initialPos)
        path.addLine(to: finalPos)
        
        tunnelNode = SKShapeNode()
        tunnelNode.path = path
        tunnelNode.position = CGPoint(x: 0, y: 0)
        tunnelNode.fillColor = UIColor.red
        tunnelNode.strokeColor = UIColor.blue
        tunnelNode.lineWidth = 10
        tunnelNode.zPosition = -1
        self.scene.addChild(tunnelNode)
    }
    
    func createCircle() -> SKShapeNode{
        let radius = ((firstBubble.node.size.height  - 1 ) / 2)
        let circle = SKShapeNode(circleOfRadius: radius * 2)
        circle.position = initialPos
        circle.fillColor = UIColor.blue
        circle.zPosition = -1
        
        return circle
    }
    
    func animateCircle(tunnelDuration : TimeInterval){
        self.circle = createCircle()
        self.scene.addChild(self.circle)
        let reduce = reduceCircle()
        
        let move = moveCircleFromNodes(duration: tunnelDuration)
        let sequence = SKAction.sequence([reduce, move])
        self.circle.run(sequence, completion: {
            return
        })
    }
    
    func reduceCircle() -> SKAction{
        let resizeAction = SKAction.scale(by: 0.5, duration: 1)
        return resizeAction
    }
    
    func moveCircleFromNodes(duration : TimeInterval) -> SKAction{
        let moveAction = SKAction.move(to: self.lastBubble.node.position, duration: duration)
        return moveAction
    }
    
    
}
