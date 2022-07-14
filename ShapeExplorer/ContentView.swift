//
//  ContentView.swift
//  ShapeExplorer
//
//  Created by Labtanza on 7/14/22.
//
//TODO: Strokes as insets? 

import SwiftUI

struct ContentView: View {
    var color:Color = .blue
    
    var body: some View {
        VStack {
            Group {
                Text("Built in shapes and functions.")
                Circle().stroke(color, style: (StrokeStyle(lineWidth: 20.0))).border(.black)
                Circle().size(width: 40, height: 40).stroke(color, style: (StrokeStyle(lineWidth: 20.0))).border(.black)
            }
            
            Group {
                Text("Scaling shapes from a UIBezierPath.")
                ScaledToFill(bezierPath: testShapeWIDE).stroke(color, style: (StrokeStyle(lineWidth: 20.0))).border(.black)
                ScaledToFit(bezierPath: testShapeWIDE).stroke(color, style: (StrokeStyle(lineWidth: 20.0))).border(.black)
            }
            Group {
                Text("Scaling shapes from a UIBezierPath, with shapeThatFits.")
                ScaledWithOpinions(bezierPath: testShapeWIDE).stroke(color, style: (StrokeStyle(lineWidth: 20.0))).border(.black)
                ScaledWithPreservedRatio(bezierPath: testShapeWIDE).stroke(color, style: (StrokeStyle(lineWidth: 20.0))).border(.black)
            }
            Group {
                Text("Scaling shapes from a UIBezierPath, complex")
                ScaledView(bezierPath: testShapeSQR).border(.black)
                ScaledToFill(bezierPath: testShapeSQR).stroke(color, style: (StrokeStyle(lineWidth: 20.0))).aspectRatio((Path(testShapeSQR.cgPath).naturalAspectRatio), contentMode: .fit).border(.black)
            }
            //            ScaledToAspect(bezierPath: testShapeSQR).stroke(color, style: (StrokeStyle(lineWidth: 20.0))).border(.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
