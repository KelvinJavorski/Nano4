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
    
    let interval : CGFloat = 0.428
    var points : Int16 = 0
    var acumulatedPoints : Int16 = 0
    var audioPlayer = AVAudioPlayer()
    var phases = [Phase]()
    
    func loadPhases(){
        phases = [
            Phase(music: "Neon_Storm.mp3", steps:
                [
                    // Eu usei as coordenadas como porcentagens [-100, 100]
                    //Cria um intervalo para adequar o inicio da bolha com o inicio da batida
                    Step(TimeInterval(1.5 * 0.9)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(interval)),
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                    s1: CGPoint(x: -40.0, y: +20.0 ), TimeInterval(interval)),
                    
                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0.459)),
                    Step(s0: CGPoint(x: 70.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0.394)),
                    Step(s0: CGPoint(x: 80.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0.421)),
                    Step(s0: CGPoint(x: -10.0, y: -90.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0.433)),
                    Step(s0: CGPoint(x: -30.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0.42)),

                    Step(s0: CGPoint(x: -10.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0.445)),

                    Step(s0: CGPoint(x: 00.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0.421)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0.458)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0.395)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0.433)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0.445)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0.433)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0.433)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0.420)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0.433)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0.420)),

                    Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                         s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(0.459)),

                    Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                         s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(0.407)),

                    Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(0.408)),

                    Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(0.451)),

                    Step(s0: CGPoint(x: 66.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(0.420)),

                    Step(s0: CGPoint(x: -66.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(0.433)),

                    Step(s0: CGPoint(x: 33.0, y: 30.0 ),
                         s1: CGPoint(x: 0.0, y: -80.0 ),TimeInterval(0.382)),

                    Step(s0: CGPoint(x: -33.0, y: 30.0 ),
                         s1: CGPoint(x: -0.0, y: -80.0 ),TimeInterval(0.420)),

                    Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                         s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                         s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 80.0, y: 70.0 ),
                         s1: CGPoint(x: -20.0, y: -20.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -80.0, y: 70.0 ),
                         s1: CGPoint(x: 20.0, y: -20.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 80.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: 20.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -80.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: 20.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                         s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                         s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 66.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -66.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 33.0, y: 30.0 ),
                         s1: CGPoint(x: 0.0, y: -80.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -33.0, y: 30.0 ),
                         s1: CGPoint(x: -0.0, y: -80.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 66.0, y: 70.0 ),
                         s1: CGPoint(x: 66.0, y: -50.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -66.0, y: 70.0 ),
                         s1: CGPoint(x: -66.0, y: -50.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 33.0, y: 50.0 ),
                         s1: CGPoint(x: 33.0, y: -70.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -33.0, y: 50.0 ),
                         s1: CGPoint(x: -33.0, y: -70.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 80.0, y: 70.0 ),
                         s1: CGPoint(x: -20.0, y: -20.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -80.0, y: 70.0 ),
                         s1: CGPoint(x: 20.0, y: -20.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 80.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: 20.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -80.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: 20.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -80.0 ),
                         s1: CGPoint(x: -40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: -50.0, y: -70.0 ),
                         s1: CGPoint(x: 20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -80.0 ),
                         s1: CGPoint(x: 40.0, y: -20.0 ), TimeInterval(0)),

                    Step(s0: CGPoint(x: 50.0, y: -70.0 ),
                         s1: CGPoint(x: -20.0, y: -60.0 ),TimeInterval(0)),

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
