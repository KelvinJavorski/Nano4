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
//        Phase(music: "Try.mp3", steps:
//        [
//            // Eu usei as coordenadas como porcentagens [-100, 100]
//            Step(CGPoint(x: 50.0, y: 70.0), TimeInterval(0.0)),
//            Step(CGPoint(x: 60.0, y: 20.0), TimeInterval(2.09)),
//            Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval(2.09)),//4.18
//            Step(CGPoint(x: 10.0, y: 10.0), TimeInterval(2.85)),//7.03
//            Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval(2.19)),//9.22
//            Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval(1.97)),//11.19
//            Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval(2.86))//,//14.05
//                Step(CGPoint(x: 50.0, y: 70.0), TimeInterval(0.0)),
//                Step(CGPoint(x: 60.0, y: 20.0), TimeInterval(1.94)),
//                Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval(2.09)),//4.18
//                Step(CGPoint(x: 10.0, y: 10.0), TimeInterval(2.85)),//7.03
//                Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval(2.19)),//9.22
//                Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval(1.97)),//11.19
//                Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval(2.86)),//14.05
////            Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval()),//15.00
////            Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval()//16.13
//        ]
//        ),
        Phase(music: "Neon_Storm.mp3", steps:
        [
            // Eu usei as coordenadas como porcentagens [-100, 100]
            Step(TimeInterval(2.0)),
            Step(s0: CGPoint(x: 50.0, y: -90.0 ),
                 s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(2.0000)),
            Step(TimeInterval(2.0)),
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000)),
            Step(TimeInterval(2.0)),
            Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                 s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(2.0000)),
            Step(TimeInterval(2.0)),
//            Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval()),//15.00
//            Step(CGPoint(x: 10.0, y: 0.0 ), TimeInterval()//16.13
        ]
        )
    ]
}
