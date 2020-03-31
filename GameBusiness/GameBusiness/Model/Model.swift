//
//  Model.swift
//  GameBusiness
//
//  Created by Saulo de Freitas Martins da Silva on 11/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

let PHASES_VEL = CGFloat(2.7)

class Model {
    
    static let shared = Model()
    
    let interval = 0.2
    var totalPoints = 0
    var acumulatedPoints = 0
    lazy var phases: [Phase] = [
        Phase(music: "Neon_Storm.mp3", steps:
        [
            // Eu usei as coordenadas como porcentagens [-100, 100]
//            Step(TimeInterval(2)),
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            Step(s0: CGPoint(x: 70.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            Step(s0: CGPoint(x: 80.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            Step(TimeInterval(1)),
            Step(s0: CGPoint(x: -10.0, y: -90.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -30.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -10.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 00.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                 s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                 s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                 s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                 s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 66.0, y: 50.0 ),
                 s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -66.0, y: 50.0 ),
                 s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 33.0, y: 30.0 ),
                 s1: CGPoint(x: 0.0, y: -80.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -33.0, y: 30.0 ),
                 s1: CGPoint(x: -0.0, y: -80.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                 s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                 s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                 s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                 s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 80.0, y: 70.0 ),
                 s1: CGPoint(x: -20.0, y: -20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -80.0, y: 70.0 ),
                 s1: CGPoint(x: 20.0, y: -20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 80.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: 20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -80.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: 20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                 s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                 s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                 s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                 s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 66.0, y: 50.0 ),
                 s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -66.0, y: 50.0 ),
                 s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 33.0, y: 30.0 ),
                 s1: CGPoint(x: 0.0, y: -80.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -33.0, y: 30.0 ),
                 s1: CGPoint(x: -0.0, y: -80.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                 s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                 s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                 s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                 s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 80.0, y: 70.0 ),
                 s1: CGPoint(x: -20.0, y: -20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -80.0, y: 70.0 ),
                 s1: CGPoint(x: 20.0, y: -20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 80.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: 20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -80.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: 20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                 s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                 s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                 s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                 s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                 s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 66.0, y: 50.0 ),
                 s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -66.0, y: 50.0 ),
                 s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 33.0, y: 30.0 ),
                 s1: CGPoint(x: 0.0, y: -90.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -33.0, y: 30.0 ),
                 s1: CGPoint(x: -0.0, y: -90.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                 s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                 s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                 s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                 s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 80.0, y: 70.0 ),
                 s1: CGPoint(x: -20.0, y: -20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -80.0, y: 70.0 ),
                 s1: CGPoint(x: 20.0, y: -20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: 80.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: 20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            
            Step(s0: CGPoint(x: -80.0, y: -70.0 ),
                 s1: CGPoint(x: 20.0, y: 20.0 ),TimeInterval(2.0000/PHASES_VEL)),
            Step(TimeInterval(interval))
        ]
        )
    ]
}
