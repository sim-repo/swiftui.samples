//
//  CustomShape.swift
//  swiftui.followEffect
//
//  Created by Igor Ivanov on 11.10.2020.
//

import SwiftUI

struct CustomShape: Shape {
    
    var points: [CGPoint]
    
    func path(in rect: CGRect) -> Path {
       return createPath()
    }
    
    func createPath() -> Path {
        var path = Path()
        
        for (idx,point) in points.enumerated() {
            
            if idx == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        return path
    }
    
}
