//
//  ContentView.swift
//  swiftui.VectorArithmetic
//
//  Created by Igor Ivanov on 10.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var vector = AnimatableVector(values: genCoordinate())
    
    var body: some View {
        LineShape(vector: vector)
            .stroke(Color.blue)
            .animation(Animation.easeInOut(duration: 2).repeatForever())
            .onAppear {
                self.vector = AnimatableVector(values: genCoordinate())
            }
    }
}

private func genCoordinate() -> [Double] {
    let count = Int.random(in: 10...400)
    var coordinates = [Double]()
    for _ in 0...count {
        let num = Int.random(in: 0...200)
        coordinates.append(Double(num))
    }
    return coordinates
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
