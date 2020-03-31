//
//  Step.swift
//  GameBusiness
//
//  Created by Kelvin Javorski Soares on 30/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Step {
    
    internal init(s0: CGPoint, s1: CGPoint, _ duration: TimeInterval) {
        self.position0 = s0
        self.position1 = s1
        self.stepDuration = duration
    }
    
    internal init(_ duration: TimeInterval) {
        self.isInterval = true
        self.stepDuration = duration
    }
    
    var isInterval: Bool = false
    var isFinished: Bool = false
    var position0: CGPoint!
    var position1: CGPoint!
    var bubble: Bubble!
    var circle: Circle!
    
    var stepDuration: TimeInterval!
    var circleDuration: TimeInterval = TimeInterval(1)
    var currentTime = TimeInterval()
    var nextBubbleCurrentTime = TimeInterval()
    
    var createNewStep: Bool = false
    var addBubble: Bool = true
    var stepWasCreated: Bool = false
    
    func update(deltaTime: TimeInterval){
        currentTime += deltaTime
        nextBubbleCurrentTime += deltaTime
        var parcial = currentTime / circleDuration
        var nextBubbleParcial = nextBubbleCurrentTime / stepDuration!
        
        if nextBubbleParcial >= 1 && !stepWasCreated{
            stepWasCreated = true
            createNewStep = true
            nextBubbleParcial = 1
            nextBubbleCurrentTime = 0
//
        }
        if parcial >= 1 && !isFinished{
            parcial = 1
            currentTime = 0
            isFinished = true
            if(!isInterval){
                bubble.node.removeFromParent()
                circle.node.removeFromParent()
            }
        }
    }
}