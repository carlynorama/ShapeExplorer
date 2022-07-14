//
//  TestShapes.swift
//  ShapeExplorer
//
//  Created by Labtanza on 7/14/22.
//

import SwiftUI


var testShapeSQR:UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0.534, y: 0.5816))
    path.addCurve(to: CGPoint(x: 0.1877, y: 0.088), controlPoint1: CGPoint(x: 0.534, y: 0.5816), controlPoint2: CGPoint(x: 0.2529, y: 0.4205))
    path.addCurve(to: CGPoint(x: 0.9728, y: 0.8259), controlPoint1: CGPoint(x: 0.4922, y: 0.4949), controlPoint2: CGPoint(x: 1.0968, y: 0.4148))
    path.addCurve(to: CGPoint(x: 0.0397, y: 0.5431), controlPoint1: CGPoint(x: 0.7118, y: 0.5248), controlPoint2: CGPoint(x: 0.3329, y: 0.7442))
    path.addCurve(to: CGPoint(x: 0.6211, y: 0.0279), controlPoint1: CGPoint(x: 0.508, y: 1.1956), controlPoint2: CGPoint(x: 1.3042, y: 0.5345))
    path.addCurve(to: CGPoint(x: 0.6904, y: 0.3615), controlPoint1: CGPoint(x: 0.7282, y: 0.2481), controlPoint2: CGPoint(x: 0.6904, y: 0.3615))
    return path
}

var testShapeWIDE:UIBezierPath {
    let shape = UIBezierPath()
    shape.move(to:CGPoint(x:0.1999748726675854, y:0.0014777218307084894))
    shape.addCurve(to: CGPoint(x: 0.9498805756410178, y: 0.40809326976717486), controlPoint1: CGPoint(x: 0.973211033738437, y: -0.02851849913657034), controlPoint2: CGPoint(x: 0.9498805756410178, y:0.40809326976717486))
    shape.addCurve(to: CGPoint(x: 0.8165640468378754, y: 0.6247326986022941), controlPoint1: CGPoint(x: 0.9498805756410178, y: 0.40809326976717486), controlPoint2: CGPoint(x: 1.1265251094054918, y:0.8413721671688492))
    shape.addCurve(to: CGPoint(x: 0.1999748726675854, y: 0.40809326976717486), controlPoint1: CGPoint(x: 0.5066029842702591, y: 0.40809326976717486), controlPoint2: CGPoint(x: 0.4632750985032352, y:0.18812092969854888))
    shape.addCurve(to: CGPoint(x: 0.1999748726675854, y: 0.0014777218307084894), controlPoint1: CGPoint(x: -0.06665828426728915, y: 0.6247326986022941), controlPoint2: CGPoint(x: -0.06665828426728915, y:0.0014777218307084894))
    shape.close()
    return shape
}
