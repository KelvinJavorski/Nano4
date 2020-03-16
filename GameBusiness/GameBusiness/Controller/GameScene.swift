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
    var bubbles : [Bubble] = [Bubble]()
    var currentPhase : Phase!
    var tunnel : Tunnel!
    var tunnels : [Tunnel] = [Tunnel]()
    var handle : SKSpriteNode!
    var height : CGFloat!
    var width : CGFloat!
    var animationTimer : Timer?
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        height = self.scene?.size.height
        width = self.scene?.size.width
        currentPhase = Model.shared.phases[0]
        initPhase()
    }
    
    func initPhase(){
        let bubbleIndex = 0
        var stepsIndex = 0
        let usufulHeight = self.height / 200
        let usufulWidth = self.width / 200
        //Inicia animações dos circulos e dos tuneis
        animationTimer = Timer.scheduledTimer(withTimeInterval: self.currentPhase.steps[stepsIndex].duration, repeats: true) { (timer) in
            //Finaliza timer caso a fase acabe
            if stepsIndex >= self.currentPhase.steps.count - 1{
                timer.invalidate()
            }
            let step = self.currentPhase.steps[stepsIndex]
            if (step.isInterval != true ){
                let firstPosition = CGPoint(x: step.position0.x * usufulWidth, y: step.position0.y * usufulHeight)
                let secondPosition = CGPoint(x: step.position1.x * usufulWidth, y: step.position1.y * usufulHeight)
                self.createBubble(position: firstPosition)
                self.createBubble(position: secondPosition)
                //Cria um tunnel dá primeira bubble até a segunda
                self.tunnel = Tunnel(scene: self, firstBubble: self.bubbles[bubbleIndex],  lastBubble: self.bubbles[bubbleIndex+1])
                self.tunnel.animateCircle(tunnelDuration: step.duration)
                self.bubbles.removeAll()
            }
            stepsIndex+=1
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
