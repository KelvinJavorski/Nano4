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
    weak var viewController : GameViewController?
    
    var currentPhase : Phase!
    var handle : SKSpriteNode!
    var teste = 1.0
    var background : SKSpriteNode!
    
    var stepsManager : StepsManager!
    var gameIsPaused : Bool = false
    var lastTime: TimeInterval = TimeInterval(0)
    var lastPauseState: Bool = false
    var points: Int16 = 0
        
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        Model.shared.loadPhases()
        
        stepsManager = StepsManager(scene: self)
        currentPhase = Model.shared.phases[0]
        background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -10
        addChild(background)
        initPhase()
    }
    
    func initPhase(){
        
        stepsManager.stepsAvailable.append(currentPhase.steps[0])
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lastPauseState != gameIsPaused{
            if gameIsPaused{
                Model.shared.audioPlayer.pause()
            }
            else{
                Model.shared.audioPlayer.play()
            }
        }
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
        
        lastPauseState = gameIsPaused
        
        if stepsManager.gameEnded{
            stepsManager.gameEnded = false
            Model.shared.audioPlayer.stop()
            Model.shared.points = points
            viewController?.performSegue(withIdentifier: "placarSegue", sender: true)
            self.isPaused = true
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
                        points += 1
//                        Model.shared.acumulatedPoints += 1
                        viewController?.scoreLabel.text = "Score: \(points)"
                        step.circle.isPointable = false
                        step.circle.isReducing = true
                    }
                }
            }
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {}
    
    func touchUp(atPoint pos : CGPoint) {}
    
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
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
}
