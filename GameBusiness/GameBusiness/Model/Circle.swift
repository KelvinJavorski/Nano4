//
//  Circle.swift
//  GameBusiness
//
//  Created by Kelvin Javorski Soares on 18/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Circle{
    internal init(scene: GameScene?, bubble: Bubble, duration: TimeInterval) {
        self.scene = scene
        self.bubble = bubble
        self.duration = duration
        setupNode()
        setupInterval()
    }
    
    var pointLabel: SKLabelNode!
    
    var node : SKShapeNode!
    var scene: GameScene!
    var bubble: Bubble!
    var origem: CGPoint!
    var duration: TimeInterval!
    
    var reduceDuration: TimeInterval!
    var reduceCurrentTime = TimeInterval()
    var isReducing = true
    
    var isPointable = false
    
    var increaseDuration: TimeInterval!
    var increaseCurrentTime = TimeInterval()
    var isIncreasing = false
    
    var moveDuration: TimeInterval!
    var moveCurrentTime = TimeInterval()
    var isMoving = false
    var isInside = true
    var bubbleIsAlive = true
    
    var finished = false
    
    func update(deltaTime: TimeInterval){
        if isReducing{
            reduce(deltaTime: deltaTime)
        }
        else if isIncreasing{
            increase(deltaTime: deltaTime)
        }
    }
    
    private func setupNode(){
        let height = bubble.node.size.height
        let radius = ((height - 1 ) / 2)
        let circle = SKShapeNode(circleOfRadius: radius * 2)
        circle.strokeColor = UIColor.white
        circle.lineWidth = 5
        circle.zPosition = -1
        circle.position = bubble.node.position
        
        self.node = circle
        self.origem = node.position
        scene.addChild(node)
    
    }
    
    private func setupInterval(){
        reduceDuration = duration * 0.97
        increaseDuration = duration * 0.1
    }
    
    func reduce(deltaTime: TimeInterval){
        reduceCurrentTime += deltaTime
//        let increaseVelocity = 0.5 / reduceDuration
//        let increaseAmount : CGFloat = CGFloat(deltaTime * increaseVelocity)
        
//        bubble.node.alpha += increaseAmount
        var parcial = CGFloat(reduceCurrentTime / reduceDuration)
        if parcial >= 0.6 && parcial <= 1{
            isPointable = true
            node.strokeColor = UIColor.green
        }
        if parcial >= 1{
            parcial = 1
            reduceCurrentTime = 0
            isReducing = false
            isIncreasing = true
            isPointable = false
            Model.shared.totalPoints += 1
        }
//
//        var tempo = 120.0 // seg
//        var velocidade = 200.0 / tempo
//        var deslocamento = deltaTime * velocidade
//        var tamanho -= deslocamento
        
        let scale : CGFloat = 0.5
        node.setScale(node.xScale - scale * CGFloat(deltaTime))
    }
    
    func increase(deltaTime: TimeInterval){
        increaseCurrentTime += deltaTime
        node.strokeColor = UIColor.white
        var parcial = CGFloat(increaseCurrentTime / increaseDuration)
        if parcial >= 1{
            parcial = 1
            increaseCurrentTime = 0
            isIncreasing = false
            node.strokeColor = UIColor.white
        }
        
        let scale: CGFloat = 1.2
        node.setScale(node.xScale + scale * CGFloat(deltaTime))
    }
    
}
