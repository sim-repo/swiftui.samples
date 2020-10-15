//
//  ClockShape.swift
//  MyClock
//
//  Created by Igor Ivanov on 14.10.2020.
//

import SwiftUI

struct ClockShape: Shape {
    
    var clock: Clock
    let radius: Double
    let center: CGPoint

    var animatableData: Clock {
        get {
            clock
        }
        set {
            clock = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
    
        let hHypotenuse = Double(radius) * 0.5
        let mHypotenuse = Double(radius) * 0.7
        let sHypotenuse = Double(radius) * 0.9
        
        let hAngle: Angle = .degrees(Double(clock.hours)/12 * 360 - 90)
        let mAngle: Angle = .degrees(Double(clock.minutes)/60 * 360 - 90)
        let sAngle: Angle = .degrees(Double(clock.seconds)/60 * 360 - 90)
        
        let hNeedle = CGPoint(x: center.x + CGFloat(cos(hAngle.radians)*hHypotenuse),
                              y: center.y + CGFloat(sin(hAngle.radians)*hHypotenuse))
        
        let mNeedle = CGPoint(x: center.x + CGFloat(cos(mAngle.radians)*mHypotenuse),
                              y: center.y + CGFloat(sin(mAngle.radians)*mHypotenuse))
        
        let sNeedle = CGPoint(x: center.x + CGFloat(cos(sAngle.radians)*sHypotenuse),
                              y: center.y + CGFloat(sin(sAngle.radians)*sHypotenuse))
        
        
        path.move(to: center)
        path.addLine(to: hNeedle)
        path = path.strokedPath(StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
        
        path.move(to: center)
        path.addLine(to: mNeedle)
        path = path.strokedPath(StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
        
        path.move(to: center)
        path.addLine(to: sNeedle)
        path = path.strokedPath(StrokeStyle(lineWidth: 1.0))
        
        return path
    }
}
