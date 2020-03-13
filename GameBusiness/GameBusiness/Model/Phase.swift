//
//  Level.swift
//  GameBusiness
//
//  Created by Saulo de Freitas Martins da Silva on 11/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Phase {
    internal init(music: String?, steps: [Step]?) {
        self.music = music
        self.steps = steps
    }
    
    // TODO: define music type.
    var music: String!
    var steps: [Step]!
}
class Step {
    
    internal init(s0: CGPoint, s1: CGPoint, _ duration: TimeInterval) {
        self.position0 = s0
        self.position1 = s1
        self.duration = duration
    }
    
    internal init(_ duration: TimeInterval) {
        self.isInterval = true
        self.duration = duration
    }
    
    var isInterval: Bool = false
    var position0: CGPoint!
    var position1: CGPoint!
    var duration: TimeInterval!
}
