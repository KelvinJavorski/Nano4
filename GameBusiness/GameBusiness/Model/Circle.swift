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
    internal init(scene: GameScene?, bubble: Bubble, destination: CGPoint, duration: TimeInterval) {
        self.scene = scene
        self.bubble = bubble
        self.destination = destination
        self.duration = duration
        setupNode()
        setupInterval()
    }
    
    var node : SKShapeNode!
    var scene: GameScene!
    var bubble: Bubble!
    var origem: CGPoint!
    var destination: CGPoint!
    var distance: CGFloat!
    var duration: TimeInterval!
    
    var reduceDuration: TimeInterval!
    var reduceCurrentTime = TimeInterval()
    var isReducing = true
    
    var isPointable = true
    
    var increaseDuration: TimeInterval!
    var increaseCurrentTime = TimeInterval()
    var isIncreasing = false
    
    var moveDuration: TimeInterval!
    var moveCurrentTime = TimeInterval()
    var isMoving = false
    var isInside = true
    
    var finished = false
    
    func update(deltaTime: TimeInterval){
        if isReducing{
            reduce(deltaTime: deltaTime)
        }
        else if isIncreasing{
            increase(deltaTime: deltaTime)
        }
//        else if isMoving{
//            move(deltaTime: deltaTime)
//        }
        
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
        
        let array = destination - origem
        self.distance = array.length()
        print(self.distance ?? 0)
    }
    
    private func setupInterval(){
        reduceDuration = duration * 0.9
        increaseDuration = duration * 0.1
        moveDuration = duration * 0.5 + TimeInterval(distance * 0.01)
    }
    
    func reduce(deltaTime: TimeInterval){
        reduceCurrentTime += deltaTime
        
        var parcial = CGFloat(reduceCurrentTime / reduceDuration)
        if parcial >= 0.5 && parcial <= 1{
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
        
        let scale : CGFloat = 0.9
        node.setScale(node.xScale - scale * CGFloat(deltaTime))
    }
    
    func increase(deltaTime: TimeInterval){
        increaseCurrentTime += deltaTime
        
        var parcial = CGFloat(increaseCurrentTime / increaseDuration)
        if parcial >= 1{
            parcial = 1
            increaseCurrentTime = 0
            isIncreasing = false
            isMoving = true
            node.strokeColor = UIColor.white
        }
        
        let scale: CGFloat = 1.6
        node.setScale(node.xScale + scale * CGFloat(deltaTime))
    }
    
    func move(deltaTime: TimeInterval){
        moveCurrentTime += deltaTime
        
        var parcial = CGFloat(moveCurrentTime / moveDuration)
        
        bubbleIsInsideCircle()
        
        if parcial >= 1{
            parcial = 1
            moveCurrentTime = 0
            isMoving = false
            finished = true
            Model.shared.totalPoints += 1
            bubble.explodeBubble()
        }
        
        let vetor = destination - origem
        let vetorParcial = parcial * vetor
        
        node.position = origem + vetorParcial
    }
    
    func bubbleIsInsideCircle(){
        let vetor = bubble.node.position - self.node.position
        print(vetor.length())
    }
}
