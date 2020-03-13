//
//  OperatorsOverloading.swift
//  InterfaceTraining
//
//  Created by Rafael Forbeck on 27/07/17.
//  Copyright © 2017 Rafael Forbeck. All rights reserved.
//

import CoreGraphics

func +(left: CGPoint, right: CGPoint) -> CGPoint {
    
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
    
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func *(left: CGFloat, right: CGPoint) -> CGPoint {
    
    return CGPoint(x: left * right.x, y: left * right.y)
}

func /(left: CGFloat, right: CGPoint) -> CGPoint {
    
    return CGPoint(x: right.x / left, y: right.y / left)
}

func /(left: CGPoint, right: CGFloat) -> CGPoint {
    
    return CGPoint(x: left.x / right, y: left.y / right)
}
