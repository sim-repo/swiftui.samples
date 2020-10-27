//
//  AppState.swift
//  swiftui.workout
//
//  Created by Igor Ivanov on 27.10.2020.
//

import Foundation

struct AppState {
    var workouts: [Workout]
    var sortType: SortType?
    
    enum SortType {
        case distance
        case complexity
    }
}
