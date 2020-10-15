//
//  Clock.swift
//  MyClock
//
//  Created by Igor Ivanov on 14.10.2020.
//

import SwiftUI


struct Clock {
    var hours: Int
    var minutes: Int
    var seconds: Double
    
    init(_ h: Int, _ m: Int, _ s: Double) {
        self.hours = h
        self.minutes = m
        self.seconds = s
    }
    
    init(_ seconds: Double) {
        let h = Int(seconds) / 3600
        let m = (Int(seconds) - (h*3600)) / 60
        let s = seconds - Double((h*3600) + (m * 60))
        self.hours = h
        self.minutes = m
        self.seconds = s
    }
    
    var asSeconds: Double {
        return Double(self.hours * 3600 + self.minutes * 60) + self.seconds
    }
}


extension Clock: VectorArithmetic {
    
    mutating func scale(by rhs: Double) {
        var s = Double(self.asSeconds)
        s.scale(by: rhs)
        
        let clock = Clock(s)
        self.hours = clock.hours
        self.minutes = clock.minutes
        self.seconds = clock.seconds
    }
    
    var magnitudeSquared: Double {
        return asSeconds * asSeconds
    }
    
    static var zero: Clock {
        return Clock(0, 0, 0)
    }
    
    static func + (lhs: Clock, rhs: Clock) -> Clock {
        return Clock(lhs.asSeconds + rhs.asSeconds)
    }
    
    static func - (lhs: Clock, rhs: Clock) -> Clock {
        return Clock(lhs.asSeconds - rhs.asSeconds)
    }
    
    static func -= (lhs: inout Clock, rhs: Clock) {
        lhs = lhs - rhs
    }
    
    static func += (lhs: inout Clock, rhs: Clock) {
        lhs = lhs + rhs
    }
}
