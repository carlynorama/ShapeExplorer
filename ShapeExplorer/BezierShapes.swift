//
//  BezierShapes.swift
//  ShapeExplorer
//
//  Created by Labtanza on 7/14/22.
//
// TODO: Mac doesn't do UIBezierPath()??? This should all just be Path()?

import Foundation
import SwiftUI

struct ScaledWithPreservedRatio:Shape {
    let bezierPath:UIBezierPath
    let ptOpinion:Double = 100
    
    func path(in rect: CGRect) -> Path {
        //Test - if size that fits is doing it's job these should be equal.
        let widthMultiplier = rect.width/bezierPath.cgPath.boundingBoxOfPath.width
        let heightMultiplier = rect.height/bezierPath.cgPath.boundingBoxOfPath.height
        
        let path = Path(bezierPath.cgPath)
        
        let transform = CGAffineTransform.identity.scaledBy(x: widthMultiplier, y: heightMultiplier)
        
        return path.applying(transform)
    }
    
    var aspectRatio:Double {
        Path(bezierPath.cgPath).naturalAspectRatio
    }
    
    var pathWidth:Double {
        bezierPath.cgPath.boundingBoxOfPath.width
    }
    
    var pathHeight:Double {
        bezierPath.cgPath.boundingBoxOfPath.height
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        print("proposed size\(proposal)")
        var multiplier = 1.0
        let fittingRequest = proposal.replacingUnspecifiedDimensions()
        let aspectRatioRect = fittingRequest.width/fittingRequest.height
        
        if aspectRatio > aspectRatioRect {
            multiplier = fittingRequest.width/pathWidth
        } else {
            multiplier = fittingRequest.height/pathHeight
        }
        
        return CGSize(width: multiplier*pathWidth, height: multiplier*pathHeight)
//        let aspectRatio = Path(bezierPath.cgPath).naturalAspectRatio
//        print("proposed size\(proposal)")
//        return (CGSize(width:ptOpinion*aspectRatio, height: ptOpinion))
    }
}

struct ScaledWithOpinions:Shape {
    let bezierPath:UIBezierPath
    let ptOpinion:Double = 100
    
    func path(in rect: CGRect) -> Path {
        //Test - if size that fits is doing it's job these should be equal.
        let widthMultiplier = rect.width/bezierPath.cgPath.boundingBoxOfPath.width
        let heightMultiplier = rect.height/bezierPath.cgPath.boundingBoxOfPath.height
        
        let path = Path(bezierPath.cgPath)
        
        let transform = CGAffineTransform.identity.scaledBy(x: widthMultiplier, y: heightMultiplier)
        
        return path.applying(transform)
    }
    
    var aspectRatio:Double {
        Path(bezierPath.cgPath).naturalAspectRatio
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        let aspectRatio = Path(bezierPath.cgPath).naturalAspectRatio
        print("proposed size\(proposal)")
        return (CGSize(width:ptOpinion*aspectRatio, height: ptOpinion))
    }
}

struct ScaledToFit:Shape {
    let bezierPath:UIBezierPath
    
    func path(in rect: CGRect) -> Path {
        
        let bounds = bezierPath.cgPath.boundingBoxOfPath
        var multiplier = 1.0
        
        let aspectRatioOP = bounds.width/bounds.height
        let aspectRatioRect = rect.width/rect.height
        
        if aspectRatioOP > aspectRatioRect {
            multiplier = rect.width/bounds.width
        } else {
            multiplier = rect.height/bounds.height
        }
        
        let path = Path(bezierPath.cgPath)
        
        let transform = CGAffineTransform.identity.scaledBy(x: multiplier , y: multiplier)
        
        return path.applying(transform)
    }
}

struct ScaledToFill: Shape {
    let bezierPath:UIBezierPath
    
    func path(in rect: CGRect) -> Path {
        let widthMultiplier = rect.width/bezierPath.cgPath.boundingBoxOfPath.width
        let heightMultiplier = rect.height/bezierPath.cgPath.boundingBoxOfPath.height
        
        let path = Path(bezierPath.cgPath)
        
        let transform = CGAffineTransform.identity.scaledBy(x: widthMultiplier, y: heightMultiplier)
        
        return path.applying(transform)
    }
}

struct ScaledView:View {
    let bezierPath:UIBezierPath
    let contentMode:ContentMode = .fit
    
    var body: some View {
        Group {
            ScaledToFit(bezierPath: bezierPath).aspectRatio(aspectRatio, contentMode: contentMode)
        }
    }
    
    var aspectRatio:Double {
        Path(bezierPath.cgPath).naturalAspectRatio
    }
}
