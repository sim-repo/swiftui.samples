//
//  swiftui_workoutApp.swift
//  swiftui.workout
//
//  Created by Igor Ivanov on 27.10.2020.
//

import SwiftUI

@main
struct swiftui_workoutApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Store())
        }
    }
}
