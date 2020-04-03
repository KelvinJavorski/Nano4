//
//  StepsManager.swift
//  GameBusiness
//
//  Created by Kelvin Javorski Soares on 03/04/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class StepsManager{
    internal init(scene: GameScene!){
        self.scene = scene
    }
    
    var numberOfStepsAvailable: Int = 0
    var stepsAvailable: [Step] = [Step]()
    var scene : GameScene!
    
    func nextBubble(step : Step, phase: Phase){
        if numberOfStepsAvailable < phase.steps.count - 1 {
            step.createBubble(scene: scene)
            step.createCircle(scene: scene)
        }
    }
    
    func update(deltaTime: TimeInterval, phase: Phase){
        
        for index in 0 ... stepsAvailable.count - 1{
            let step = stepsAvailable[index]
            step.update(deltaTime: deltaTime)
            if (!step.isInterval){
                if step.addBubble{
                    nextBubble(step: step, phase: phase)
                    step.addBubble = false
                }
                else if step.createNewStep{
                    numberOfStepsAvailable += 1
                    step.createNewStep = false
                }
                step.circle.update(deltaTime: deltaTime)
            }
            else{
                if step.intervalIsFinished{
                    numberOfStepsAvailable += 1
                    step.intervalIsFinished = false
                }
            }
        }
        
        if numberOfStepsAvailable > stepsAvailable.count - 1 && numberOfStepsAvailable < phase.steps.count{
            stepsAvailable.append(phase.steps[numberOfStepsAvailable])
        }
        
    }
}
