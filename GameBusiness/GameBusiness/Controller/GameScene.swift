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
    
    var id: Int = 0
       var currentSteps: [Step] = [Step]()
       
       var stepsCompleted : Int = 0
       var numberOfBubbles : Int = 0
       var stepsCreated : Int = 0
       
       var lastTime: TimeInterval = TimeInterval(0)
        
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func sceneDidLoad() {
        height = self.scene?.size.height
        width = self.scene?.size.width
        currentPhase = Model.shared.phases[0]
        initPhase()
    }
    
    func initPhase(){
        currentSteps.append(currentPhase.steps[0])
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
    
    func buildBubble(step: Step){
        step.bubble = self.createBubble(position: step.position0, isFixed: false)
        step.circle = Circle(scene: self, bubble: step.bubble, duration: step.circleDuration)
    }
    
    func nextBubble(step: Step){
        if stepsCreated < self.currentPhase.steps.count - 1 {
            buildBubble(step: step)
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
        
        for index in 0 ... currentSteps.count - 1{
            let step = currentSteps[index]
            step.update(deltaTime: deltaTime)
            if (!step.isInterval){
                if step.addBubble{
                    nextBubble(step: step)
                    step.addBubble = false
                }
                else if step.createNewStep{
                    stepsCreated += 1
                    step.createNewStep = false
                }
                step.circle.update(deltaTime: deltaTime)
            }
            else{
                if step.intervalIsFinished{
                    stepsCreated += 1
                    step.intervalIsFinished = false
                }
            }
        }
        
        if stepsCreated > currentSteps.count - 1 && stepsCreated < currentPhase.steps.count{
            currentSteps.append(currentPhase.steps[stepsCreated])
        }
    }
    
    func searchClickedBubble(pos: CGPoint) -> Step{
        var step: Step!
        for index in 0 ... currentSteps.count - 1{
            if !currentSteps[index].isFinished && !currentSteps[index].isInterval{
                if currentSteps[index].bubble.node.contains(pos){
                    step = currentSteps[index]
                    return step
                }
            }
        }
        return step
    }
    
    func touchDown(atPoint pos : CGPoint) {
        let nodeArray = self.nodes(at: pos)
        self.handle = nodeArray.first as? SKSpriteNode
        if handle != nil{
            if self.handle.name == "bubble"{
                let step = searchClickedBubble(pos: pos)
                if step.circle != nil{
                    if step.circle.isPointable{
                        Model.shared.acumulatedPoints += 1
                        step.circle.isReducing = true
                    }
                }
//                self.drag(node: handle)
            }
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if handle != nil{
            if self.handle.name == "bubble"{
//                self.handle.position = pos
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
                    let step = searchClickedBubble(pos: location)
                    if !step.isFinished{
                        step.bubble.explodeBubble()
                        step.circle.isPointable = false
                        step.circle.node.removeFromParent()
                    }
                }
            }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
}
