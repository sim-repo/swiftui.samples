//
//  FollowEffect.swift
//  swiftui.followEffect
//
//  Created by Igor Ivanov on 11.10.2020.
//

import SwiftUI


struct FollowEffect: GeometryEffect {

    var fraction: CGFloat
    let path: Path
    var rotate = true
    
    @Binding var didGetCheckpoint: Bool
        
    var animatableData: CGFloat {
        get { return fraction }
        set { fraction = newValue }
    }
    
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        if !rotate {
            let point = getFractionPoint(fraction)
            
            return ProjectionTransform(CGAffineTransform(translationX: point.x, y: point.y))
        } else {
            let pt1 = getFractionPoint(fraction   )
            let pt2 = getFractionPoint(fraction + 0.01 )
            
            
            if pt1.x.isNaN || pt2.x.isNaN ||
                pt1.y.isNaN || pt2.y.isNaN {
                
                print("isNaN")
                return ProjectionTransform(.identity)
            }
            
            let dX = pt2.x - pt1.x
            let dY = pt2.y - pt1.y
            guard dX != 0 else {
                let transform = CGAffineTransform(translationX: pt2.x, y: pt2.y)
                return ProjectionTransform(transform)}
            let q = getQuarter(dX, dY)
            

            var angle: Double = 0
            if q == 2 || q == 3 {
                angle = atan(Double(dY / dX)) - Double.pi
            } else {
                angle = atan(Double(dY / dX))
            }
            
            let transform = CGAffineTransform(translationX: pt2.x, y: pt2.y).rotated(by: CGFloat(angle))
            return ProjectionTransform(transform)
        }
    }
    
    
    func getQuarter(_ dX: CGFloat, _ dY: CGFloat) -> Int {
        if dX > 0 && dY > 0 {
            return 1
        }
        if dX > 0 && dY < 0 {
            return 4
        }
        if dX < 0 && dY > 0 {
            return 2
        }
        if dX < 0 && dY < 0 {
            return 3
        }
        return 0
    }

    
    func getFractionPoint(_ percent: CGFloat) -> CGPoint {
        let pct: CGFloat = percent < 0 ? 0 : percent
        
        let f = pct > 0.999 ? CGFloat(1-0.001) : pct
        let t = pct > 0.999 ? CGFloat(1) : pct + 0.001
        let tp = path.trimmedPath(from: f, to: t)
        
        DispatchQueue.main.async {
            self.didGetCheckpoint = percent > 1
        }
        
        return CGPoint(x: tp.boundingRect.midX, y: tp.boundingRect.midY)
    }
}
