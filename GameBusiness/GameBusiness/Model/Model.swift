//
//  Model.swift
//  GameBusiness
//
//  Created by Saulo de Freitas Martins da Silva on 11/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation

let PHASES_VEL = CGFloat(2.4)

class Model {
    
    static let shared = Model()
    
    let interval : CGFloat = 2.0
    var points : Int16 = 0
    var acumulatedPoints : Int16 = 0
    var audioPlayer = AVAudioPlayer()
    var phases = [Phase]()
    
    func loadPhases(){
        phases = [
            Phase(music: "Neon_Storm.mp3", steps:
                [
                    // Eu usei as coordenadas como porcentagens [-100, 100]
                    Step(TimeInterval(2)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),
                    Step(s0: CGPoint(x: 70.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),
                    Step(s0: CGPoint(x: 80.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),
                    Step(s0: CGPoint(x: -10.0, y: -90.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),
                    Step(s0: CGPoint(x: -30.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -10.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 00.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                         s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                         s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 66.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -66.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 33.0, y: 30.0 ),
                         s1: CGPoint(x: 0.0, y: -80.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -33.0, y: 30.0 ),
                         s1: CGPoint(x: -0.0, y: -80.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                         s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                         s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 80.0, y: 70.0 ),
                         s1: CGPoint(x: -20.0, y: -20.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -80.0, y: 70.0 ),
                         s1: CGPoint(x: 20.0, y: -20.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 80.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: 20.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -80.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: 20.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                         s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                         s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 66.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -66.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 33.0, y: 30.0 ),
                         s1: CGPoint(x: 0.0, y: -80.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -33.0, y: 30.0 ),
                         s1: CGPoint(x: -0.0, y: -80.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                         s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                         s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 80.0, y: 70.0 ),
                         s1: CGPoint(x: -20.0, y: -20.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -80.0, y: 70.0 ),
                         s1: CGPoint(x: 20.0, y: -20.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 80.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: 20.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -80.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: 20.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval/PHASES_VEL)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(interval/PHASES_VEL)),

                    Step(TimeInterval(3))
                ]
                )
            ]
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
