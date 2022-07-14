//
//  AspectRatio+Paths.swift
//  ShapeExplorer
//
//  Created by Labtanza on 7/14/22.
//

import SwiftUI

extension Path {
    func getAnchors() -> [CGPoint] {
        var resultingPoints = [CGPoint]()
        self.forEach { element in
            switch element {
            case .move(let point):
                resultingPoints.append(point)
            case .closeSubpath:
                break
            case .line(to: let to):
                resultingPoints.append(to)
            case .quadCurve(to: let to, control: _):
                resultingPoints.append(to)
            case .curve(to: let to, control1: _, control2: _):
                resultingPoints.append(to)
            }
        }
        return resultingPoints
    }
    
    func getAllPoints() -> [CGPoint] {
        var resultingPoints = [CGPoint]()
        self.forEach { element in
            switch element {
            case .move(let point):
                resultingPoints.append(point)
            case .closeSubpath:
                break
            case .line(to: let to):
                resultingPoints.append(to)
            case .quadCurve(to: let to, control: let control):
                resultingPoints.append(to)
                resultingPoints.append(control)
            case .curve(to: let to, control1: let control1, control2: let control2):
                resultingPoints.append(to)
                resultingPoints.append(control1)
                resultingPoints.append(control2)
            }
        }
        return resultingPoints
    }
    
    var longDescription:String {
        var description:String = "let shape = UIBezierPath()\n"
        self.forEach { element in
            switch element {
            case .move(let point):
                description.append("shape.move(to:CGPoint(x:\(point.x), y:\(point.y)))\n")
            case .closeSubpath:
                description.append("shape.close()")
                break
            case .line(to: let point):
                description.append("shape.line(to:CGPoint(x:\(point.x), y:\(point.y)))\n")
            case .quadCurve(to: let to, control: let control):
                description.append("shape.addCurve(to: CGPoint(x: \(to.x), y: \(to.y)), controlPoint1: CGPoint(x: \(control.x), y: \(control.y)))\n")
            case .curve(to: let to, control1: let control1, control2: let control2):
                description.append("shape.addCurve(to: CGPoint(x: \(to.x), y: \(to.y)), controlPoint1: CGPoint(x: \(control1.x), y: \(control1.y)), controlPoint2: CGPoint(x: \(control2.x), y:\(control2.y)))\n")
            }
        }
        return description
    }
    
    //use self.boundingBox.min in most cases.
//    var minXAnchor:CGPoint? {
//        let points = self.getAnchors()
//        return points.min(by: {$0.x < $1.x})
//    }
//
//    var minYAnchor:CGPoint? {
//        let points = self.getAnchors()
//        return points.min(by: {$0.y < $1.y})
//    }
//
//    var maxXAnchor:CGPoint? {
//        let points = self.getAnchors()
//        return points.max(by: {$0.x < $1.x})
//    }
//
//    var maxYAnchor:CGPoint? {
//        let points = self.getAnchors()
//        return points.max(by: {$0.y < $1.y})
//    }
    
    //boundingBoxOfPath excludes control path points
    //boundingBox includes control points
    //interestingly enough, this spits out the correct value
    //but .aspectRatio does not seem to render it correctly but
    //using .scaledToFit does??
    var naturalAspectRatio:Double {
        //48.8/37.0//
        let ratio = self.cgPath.boundingBoxOfPath.width/self.cgPath.boundingBoxOfPath.height
        print("ratio: \(ratio)")
        return ratio
        //let what = self.scaledToFit()
        //return what
    }
}

