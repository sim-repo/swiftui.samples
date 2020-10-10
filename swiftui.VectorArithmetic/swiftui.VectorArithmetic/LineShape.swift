//
//  LineShape.swift
//  swiftui.VectorArithmetic
//
//  Created by Igor Ivanov on 10.10.2020.
//

import SwiftUI

struct LineShape: Shape {
    
    var vector: AnimatableVector
    
    var animatableData: AnimatableVector {
        get { vector }
        set { vector = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let xStep = rect.width / CGFloat(vector.values.count)
        
        var currentX: CGFloat = xStep
                    path.move(to: .zero)

                    vector.values.forEach {
                        path.addLine(to: CGPoint(x: currentX, y: CGFloat($0)))
                        currentX += xStep
                    }
        return path
    }
}
