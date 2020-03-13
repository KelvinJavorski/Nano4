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
    var currentPhase : Phase!
    var tunnel: Tunnel!
    var handle: SKSpriteNode!
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        initPhase()
        
        
//        tunnel = Tunnel(scene: self, firstBubble: initBubble, lastBubble: finalBubble)
//        tunnel.createTunnel(initBubble: bubbles[0], finalBubble: bubbles[1])
    }
    
    func initPhase(){
        currentPhase = Model.shared.phases[0]
        for (index, step) in currentPhase.steps.enumerated(){
            createBubble(position: 10 * step.position)
            if (index > 0) && (index < currentPhase.steps.count){
                //Cria um tunnel dá primeira bubble até a segunda
                tunnel = Tunnel(scene: self, firstBubble: bubbles[index - 1], lastBubble: bubbles[index])
                tunnel.animateCircle(tunnelDuration: step.duration)
            }
        }
    }
    
    func createBubble(position : CGPoint){
        let bubble = Bubble(scene: self, node: SKSpriteNode(imageNamed: "bubble"))
        bubble.node.name = "bubble"
        bubble.node.position = position
        
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
    
      func destroyBubble(location: CGPoint){
            let index = findBubbleNode(location)
            if (index != -1){
                bubbles[index].explodeBubble()
    //            bubbles.remove(at: index)
    //            tunnel.createTunnel(initBubble: bubbles[0], finalBubble: bubbles[1])
            }
        }
    
    func touchDown(atPoint pos : CGPoint) {
//        tunnel.animateCircle()
        initPhase()
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
                    destroyBubble(location: location)
//                        bubbles.remove(at: index)
//                        tunnel.createTunnel(initBubble: bubbles[0], finalBubble: bubbles[1])
                        
                    
                    
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
