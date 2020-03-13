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
    
    internal init(_ position: CGPoint, _ duration: TimeInterval) {
        self.position = position
        self.duration = duration
    }
    
    internal init(_ duration: TimeInterval) {
        self.isInterval = true
        self.duration = duration
    }
    
    var isInterval: Bool = false
    var position: CGPoint!
    var duration: TimeInterval!
}
