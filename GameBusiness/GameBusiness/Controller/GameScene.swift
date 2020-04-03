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
    var currentPhase : Phase!
    var handle : SKSpriteNode!
    var height : CGFloat!
    var width : CGFloat!
    
    var background : SKSpriteNode!
    var pointsLabel : SKLabelNode!
    
    var stepsManager : StepsManager!

    var reset : SKLabelNode!
    var gameIsPaused : Bool = false
    var lastTime: TimeInterval = TimeInterval(0)
        
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func sceneDidLoad() {
        stepsManager = StepsManager(scene: self)
        height = self.scene?.size.height
        width = self.scene?.size.width
        currentPhase = Model.shared.phases[0]
        background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -10
        addChild(background)
        initPhase()
    }
    
    func initPhase(){
        pointsLabel = SKLabelNode(text: "0")
        pointsLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 200)
        pointsLabel.fontSize = 50
        print(frame.maxY)
        addChild(pointsLabel)
        
        resetButton()
        
        stepsManager.stepsAvailable.append(currentPhase.steps[0])
    }
    
    func resetButton(){
        reset = childNode(withName: "reset") as? SKLabelNode
        reset.color = UIColor.red
        reset.fontSize = 50
        reset.name = "pause"
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !gameIsPaused{
            if lastTime == 0{
               lastTime = currentTime
               return
            }
        
            var deltaTime = currentTime - lastTime
            lastTime = currentTime
            
            if deltaTime > 0.1{
                deltaTime = 0.1
            }
            
            stepsManager.update(deltaTime: deltaTime, phase: currentPhase)
        }
        
    }
    
    func searchClickedBubble(pos: CGPoint) -> Step{
        var step: Step!
        for index in 0 ... stepsManager.stepsAvailable.count - 1{
            if !stepsManager.stepsAvailable[index].isFinished && !stepsManager.stepsAvailable[index].isInterval{
                if stepsManager.stepsAvailable[index].bubble.node.contains(pos){
                    step = stepsManager.stepsAvailable[index]
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
                    if step.circle.isPointable && !gameIsPaused{
                        Model.shared.acumulatedPoints += 1
                        pointsLabel.text = String(Model.shared.acumulatedPoints)
                        step.circle.isPointable = false
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
            if !gameIsPaused{
                if node.name == "bubble" {
                    let step = searchClickedBubble(pos: location)
                    if !step.isFinished{
                        step.bubble.explodeBubble()
                        step.circle.isPointable = false
                        step.circle.node.removeFromParent()
                    }
                }
            }
            if node.name == "pause"{
                print("foi")
                gameIsPaused = !gameIsPaused
                if (gameIsPaused){
                    Model.shared.audioPlayer.pause()
                }else{
                    Model.shared.audioPlayer.play()
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
}
