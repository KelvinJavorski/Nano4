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
    internal init(scene: GameScene?, bubble: Bubble, destination: CGPoint) {
        self.scene = scene
        self.bubble = bubble
        self.destination = destination
        
        setupNode()
    }
    
    var node : SKShapeNode!
    var scene: GameScene!
    var bubble: Bubble!
    var origem: CGPoint!
    var destination: CGPoint!
    
    var reduceDuration = TimeInterval(1)
    var reduceCurrentTime = TimeInterval()
    var isReducing = false
    
    var increaseDuration = TimeInterval(0.2)
    var increaseCurrentTime = TimeInterval()
    var isIncreasing = false
    
    var moveDuration = TimeInterval(2)
    var moveCurrentTime = TimeInterval()
    var isMoving = false
    
    func update(deltaTime: TimeInterval){
        if isReducing{
            reduce(deltaTime: deltaTime)
        }
        else if isIncreasing{
            increase(deltaTime: deltaTime)
        }
        else if isMoving{
            move(deltaTime: deltaTime)
        }
    }
    
    private func setupNode(){
        let height = bubble.node.size.height
        let radius = ((height - 1 ) / 2)
        let circle = SKShapeNode(circleOfRadius: radius * 2)
        circle.strokeColor = UIColor.white
        circle.zPosition = -1
        circle.position = bubble.node.position
        
        self.node = circle
        self.origem = node.position
        scene.addChild(node)
    }
    
    func reduce(deltaTime: TimeInterval){
        reduceCurrentTime += deltaTime
        
        var parcial = CGFloat(reduceCurrentTime / reduceDuration)
        if parcial >= 1{
            parcial = 1
            reduceCurrentTime = 0
            isReducing = false
            isIncreasing = true
        }
        
        let scale : CGFloat = 0.5
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
        }
        
        let scale: CGFloat = 1
        node.setScale(node.xScale + scale * CGFloat(deltaTime))
    }
    
    func move(deltaTime: TimeInterval){
        moveCurrentTime += deltaTime
        
        var parcial = CGFloat(moveCurrentTime / moveDuration)
        if parcial >= 1{
            parcial = 1
            moveCurrentTime = 0
            isMoving = false
        }
        
        let vetor = destination - origem
        let vetorParcial = parcial * vetor
        
        node.position = origem + vetorParcial
    }
}
