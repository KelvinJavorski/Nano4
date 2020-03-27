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
    var circles: [Circle] = [Circle]()
    var currentPhase : Phase!
    var tunnel : Tunnel!
    var handle : SKSpriteNode!
    var height : CGFloat!
    var width : CGFloat!
    
    var circle : Circle!
    var bubble : Bubble!
    var secondBubble: Bubble!
    
    var acquiredPoints = 0
    
    var currentStep : Step!
    var currentBubbleIndex : Int = 0
    var currentBubbleKill : Int = 0
    var stepCurrentTime = TimeInterval()
    
    var lastTime: TimeInterval = TimeInterval(0)
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        height = self.scene?.size.height
        width = self.scene?.size.width
        currentPhase = Model.shared.phases[0]
        initPhase()
    }
    
    func initPhase(){
        currentStep = self.currentPhase.steps[currentBubbleIndex]
        if (!currentStep.isInterval){
            bubble = self.createBubble(position: currentStep.position0, isFixed: false)
            bubbles.append(bubble)
            circle = Circle(scene: self, bubble: bubble, duration: currentStep.circleDuration)
            circles.append(circle)
        }
    }
    
    func createBubble(position : CGPoint, isFixed: Bool) -> Bubble{
        let usufulHeight = self.height / 200
        let usufulWidth = self.width / 200
        let fixedPosition = CGPoint(x: position.x * usufulWidth, y: position.y * usufulHeight)

        let bubble = Bubble(scene: self, node: SKSpriteNode(imageNamed: "bubble"))
        if isFixed{
            bubble.node.name = "fixedBubble"
        }else{
            bubble.node.name = "bubble"
        }
        bubble.node.position = fixedPosition
        self.addChild(bubble.node)
        return bubble
    }
    
    func buildBubble(nextStep: Step){
        bubble = self.createBubble(position: nextStep.position0, isFixed: false)
        bubbles.append(bubble)
        circle = Circle(scene: self, bubble: bubble, duration: nextStep.circleDuration)
        circles.append(circle)
    }
    
    func nextStep(){
        if (currentBubbleIndex < self.currentPhase.steps.count - 1){
            if !currentStep.isInterval{
                bubbles[0].node.removeFromParent()
                bubbles.remove(at: 0)
                circles[0].node.removeFromParent()
                circles.remove(at: 0)
            }
            currentBubbleIndex += 1
            currentStep = currentPhase.steps[currentBubbleIndex]
        }
    }
    
    func nextBubble(){
        if (currentBubbleIndex < self.currentPhase.steps.count - 1){
            let nextStep = currentPhase.steps[currentBubbleIndex + 1]
            if !nextStep.isInterval{
                buildBubble(nextStep: nextStep)
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if lastTime == 0{
           lastTime = currentTime
           return
        }
    
        var deltaTime = currentTime - lastTime
        lastTime = currentTime
        
        if deltaTime > 0.1{
            deltaTime = 0.1
        }
        
        currentStep.update(deltaTime: deltaTime)
        
        if (currentStep.addNewBubble){
            currentStep.addNewBubble = false
            nextBubble()
        }
        
        if (currentStep.isFinished){
            currentStep.isFinished = false
            print("Acquired Points: \(acquiredPoints)")
            print("Total Points: \(Model.shared.totalPoints)")
            nextStep()
        }
        
        if circle != nil{
            circle.update(deltaTime: deltaTime)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        let nodeArray = self.nodes(at: pos)
        self.handle = nodeArray.first as? SKSpriteNode
        if handle != nil{
            if self.handle.name == "bubble"{
                if circle.isPointable{
                    acquiredPoints += 1
                    circle.isPointable = false
                }
//                circle.isReducing = true
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
//                    destroyBubble(location: location)
//                        bubbles.remove(at: index)
//                        tunnel.createTunnel(initBubble: bubbles[0], finalBubble: bubbles[1])
                        
                    
                    
//                    node.removeFromParent()
                }
            }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
}
