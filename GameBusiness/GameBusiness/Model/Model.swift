//
//  Model.swift
//  GameBusiness
//
//  Created by Saulo de Freitas Martins da Silva on 11/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit
class Model {
    
    static let shared = Model()
    
    var phases: [Phase] = [
        Phase(music: "", steps:
        [
            Step(CGPoint(x: 0.0,  y: -10.0), TimeInterval(0.5)),
            Step(CGPoint(x: 10.0, y: -10.0), TimeInterval(0.5)),
            Step(CGPoint(x: 10.0, y: 0.0  ), TimeInterval(0.5)),
            Step(CGPoint(x: 10.0, y: 10.0 ), TimeInterval(0.5))
        ]
        )
    ]
}
