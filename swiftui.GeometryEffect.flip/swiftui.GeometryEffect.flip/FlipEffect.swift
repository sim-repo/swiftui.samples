//
//  FlipEffect.swift
//  swiftui.GeometryEffect.flip
//
//  Created by Igor Ivanov on 11.10.2020.
//

import SwiftUI


struct FlipEffect: GeometryEffect {
    
    @Binding var flipped: Bool
    var angle: Angle
    let axis: CGPoint
    
    
    var animatableData: Double {
        get {
            angle.degrees
        }
        set {
            angle.degrees = newValue
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            flipped = angle.degrees >= 90 && angle.degrees < 270
        }
        let radians = CGFloat(angle.radians)
        
        var transform3d = CATransform3DIdentity
        transform3d.m34 = -1/max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, radians, axis.x, axis.y, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))
        return ProjectionTransform(transform3d).concatenating(affineTransform)
    }
}
