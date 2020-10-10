//
//  AnimatableVector.swift
//  swiftui.VectorArithmetic
//
//  Created by Igor Ivanov on 10.10.2020.
//

import SwiftUI
import enum Accelerate.vDSP

struct AnimatableVector: VectorArithmetic {
    
    var magnitudeSquared: Double {
        vDSP.sum(vDSP.multiply(values, values))
    }
    
    static var zero = AnimatableVector(values: [0.0])
    
    
    var values: [Double]
    
    
    mutating func scale(by rhs: Double) {
        values = vDSP.multiply(rhs, values)
    }
    
    static func + (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        let count = min(lhs.values.count, rhs.values.count)
        return AnimatableVector(values: vDSP.add(lhs.values[0..<count], rhs.values[0..<count]))
    }
    
    static func - (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        let count = min(lhs.values.count, rhs.values.count)
        return AnimatableVector(values: vDSP.subtract(lhs.values[0..<count], rhs.values[0..<count]))
    }
    
    static func -= (lhs: inout AnimatableVector, rhs: AnimatableVector) {
        let count = min(lhs.values.count, rhs.values.count)
        vDSP.subtract(lhs.values[0..<count], rhs.values[0..<count], result: &lhs.values[0..<count])
    }
    
    static func += (lhs: inout AnimatableVector, rhs: AnimatableVector) {
        let count = min(lhs.values.count, rhs.values.count)
        vDSP.add(lhs.values[0..<count], rhs.values[0..<count], result: &lhs.values[0..<count])
    }
}
