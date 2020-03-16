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
    var tunnels: [Tunnel] = [Tunnel]()
    var handle: SKSpriteNode!
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
//        initTimer()
        initPhase()
        
        
//        tunnel = Tunnel(scene: self, firstBubble: initBubble, lastBubble: finalBubble)
//        tunnel.createTunnel(initBubble: bubbles[0], finalBubble: bubbles[1])
    }
    
//    func initTimer(){
//        let timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(3), repeats: true) { (timer) in
//            for step in currentPhase.steps{
//                if (step.isInterval != true ){
//                    let firstPosition = CGPoint(x: step.position0.x * width / 200, y: step.position0.y * height / 200)
//                    let secondPosition = CGPoint(x: step.position1.x * width / 200, y: step.position1.y * height / 200)
//                    createBubble(position: firstPosition)
//                    createBubble(position: secondPosition)
//                    //Cria um tunnel dá primeira bubble até a segunda
//                    tunnel = Tunnel(scene: self, firstBubble: bubbles[cont],  lastBubble: bubbles[cont+1])
//
//                    cont+=2
//                }
//            }
//        }
//    }
    
    func initPhase(){
        currentPhase = Model.shared.phases[0]
        let height : CGFloat = (self.scene?.size.height)!
        let width : CGFloat = (self.scene?.size.width)!
        let count = 0
        var index = 0
        var timer : Timer?
        timer = Timer.scheduledTimer(withTimeInterval: self.currentPhase.steps[index].duration, repeats: true) { (timer) in
            if index >= self.currentPhase.steps.count - 1{
                timer.invalidate()
            }
            let step = self.currentPhase.steps[index]
            if (step.isInterval != true ){
                let firstPosition = CGPoint(x: step.position0.x * width / 200, y: step.position0.y * height / 200)
                let secondPosition = CGPoint(x: step.position1.x * width / 200, y: step.position1.y * height / 200)
                self.createBubble(position: firstPosition)
                self.createBubble(position: secondPosition)
                //Cria um tunnel dá primeira bubble até a segunda
                self.tunnel = Tunnel(scene: self, firstBubble: self.bubbles[count],  lastBubble: self.bubbles[count+1])
                self.tunnel.animateCircle(tunnelDuration: step.duration)
                self.bubbles.removeAll()
//                count+=2
            }
            index+=1
        }
    }
        
//        for step in currentPhase.steps{
//            if (step.isInterval != true ){
//                let firstPosition = CGPoint(x: step.position0.x * width / 200, y: step.position0.y * height / 200)
//                let secondPosition = CGPoint(x: step.position1.x * width / 200, y: step.position1.y * height / 200)
//                createBubble(position: firstPosition)
//                createBubble(position: secondPosition)
//                //Cria um tunnel dá primeira bubble até a segunda
//                tunnel = Tunnel(scene: self, firstBubble: bubbles[cont],  lastBubble: bubbles[cont+1])
//
//                cont+=2
//            }
//        }
    
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
//        initPhase()
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
