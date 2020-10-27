//
//  Action.swift
//  swiftui.workout
//
//  Created by Igor Ivanov on 27.10.2020.
//

import Foundation

enum Action {
    case addWorkout(_ workout: Workout)
    case removeWorkout(at: IndexSet)
    case sort(by: AppState.SortType)
}
