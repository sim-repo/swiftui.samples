//
//  ContentView.swift
//  swiftui.workout
//
//  Created by Igor Ivanov on 27.10.2020.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store
    @State private var isAddingMode: Bool = false
    
    var body: some View {
        NavigationView {
            WorkoutListView()
                .navigationBarTitle("Workouts diary", displayMode: .inline)
                .navigationBarItems(
                    leading: AddButton(isAddingMode: self.$isAddingMode),
                    trailing: TrailingView()
                )
        }
        .sheet(isPresented: $isAddingMode) {
            AddWorkoutView(isAddingMode: self.$isAddingMode)
                .environmentObject(self.store)
        }
    }
}


struct AddButton: View {
    @Binding var isAddingMode: Bool
    
    var body: some View {
        Button(action: { self.isAddingMode = true }) {
            Image(systemName: "plus")
        }
    }
}


struct AddWorkoutView: View {
    @EnvironmentObject private var store: Store
    
    @State private var nameText: String = ""
    @State private var distanceText: String = ""
    @State private var complexityField: Workout.Complexity = .medium
    @State private var dateField: Date = Date()
    @Binding var isAddingMode: Bool
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $nameText)
                TextField("Distance", text: $distanceText)
                Picker(selection: $complexityField, label: Text("Complexity")) {
                    Text("Low").tag(Workout.Complexity.low)
                    Text("Medium").tag(Workout.Complexity.medium)
                    Text("High").tag(Workout.Complexity.high)
                }
                DatePicker(selection: $dateField, displayedComponents: .date) {
                    Text("Date")
                }
            }
            .navigationBarTitle("Workout Details", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: { self.isAddingMode = false }) {
                    Text("Cancel")
                },
                trailing: Button(action: {
                    let workout = Workout(
                        name: self.nameText,
                        distance: self.distanceText,
                        date: self.dateField,
                        complexity: self.complexityField
                    )
                    self.store.dispatch(action: .addWorkout(workout))
                    self.isAddingMode = false
                }) {
                    Text("Save")
                }
                .disabled(nameText.isEmpty)
            )
        }
    }
}


struct TrailingView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            Button(action: {
                switch self.store.state.sortType {
                case .distance:
                    self.store.dispatch(action: .sort(by: .distance))
                default:
                    self.store.dispatch(action: .sort(by: .complexity))
                }
            }) {
                Image(systemName: "arrow.up.arrow.down")
            }
            EditButton()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
