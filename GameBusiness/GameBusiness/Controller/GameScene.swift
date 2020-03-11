//
//  GameScene.swift
//  GameBusiness
//
//  Created by Kelvin Javorski Soares on 03/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var bubbles: [Bubble] = [Bubble]()
    var handle: SKSpriteNode!
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        for _ in 0...5{
            createBubble()
        }
    }
    
    func createBubble(){
        let bubble = Bubble(scene: self, node: SKSpriteNode(imageNamed: "bubble"))
        bubble.node.name = "bubble"
        
        //Teste//
        let randomX = CGFloat.random(in: -350...350)
        let randomY = CGFloat.random(in: -640...640)
        bubble.node.position = CGPoint(x: randomX, y: randomY)
        
        bubbles.append(bubble)
        self.addChild(bubble.node)
    }
    
    func findBubbleNode(_ location : CGPoint) -> Int {
        for (index, bubble) in bubbles.enumerated(){
            if bubble.node.contains(location){
                return index
            }
        }
        return -1
    }
    
    func touchDown(atPoint pos : CGPoint) {
        let nodeArray = self.nodes(at: pos)
        self.handle = nodeArray.first as? SKSpriteNode
        if handle != nil{
            if self.handle.name == "bubble"{
//                self.drag(node: handle)
            }
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if handle != nil{
            if self.handle.name == "bubble"{
                self.handle.position = pos
            }
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self))}
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
                let location = touch.location(in: self)
                let node = atPoint(location)
                if node.name == "bubble" {
                    let index = findBubbleNode(location)
                    if (index != -1){
                        bubbles[index].explodeBubble()
                        bubbles.remove(at: index)
                    }
                    
//                    node.removeFromParent()
                }
            }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
