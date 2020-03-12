//
//  CGPoint+Extensions.swift
//  Senses
//
//  Created by Rafael Forbeck on 17/10/17.
//  Copyright © 2017 Rafael Forbeck. All rights reserved.
//

import SpriteKit

extension CGPoint {
    
    func sqrtLength() -> CGFloat {
        return x * x + y * y
    }
    
    func length() -> CGFloat {
        return sqrt(x * x + y * y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
    
    func rotate(angle: CGFloat) -> CGPoint {
        return CGPoint(x: x * cos(angle) - y * sin(angle), y: x * sin(angle) + y * cos(angle))
    }
    
    static func newVector(withAngle angle: CGFloat) -> CGPoint {
        return CGPoint(x: 1, y: 0).rotate(angle: angle)
    }
    
    func direction() -> CGFloat {
        return atan2(y, x)
    }
}
