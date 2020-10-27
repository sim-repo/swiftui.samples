//
//  Workout.swift
//  swiftui.workout
//
//  Created by Igor Ivanov on 27.10.2020.
//

import Foundation

struct Workout: Identifiable {
    let id: UUID = .init()
    let name: String
    let distance: String
    let date: Date
    let complexity: Complexity
    
    enum Complexity: Int {
        case low
        case medium
        case high
    }
}
