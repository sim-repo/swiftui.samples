//
//  Store.swift
//  swiftui.workout
//
//  Created by Igor Ivanov on 27.10.2020.
//

import SwiftUI


final class Store: ObservableObject {
     @Published private(set) var state: AppState
     
     init(state: AppState = .init(workouts: [Workout]())) {
         self.state = state
     }
     
     public func dispatch(action: Action) {
         state = reducer(state: state, action: action)
     }
 }
