//
//  ContentView.swift
//  swiftui.metal
//
//  Created by Igor Ivanov on 07.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Text("DrawingGroup")
                        .foregroundColor(.black)
                        .padding(20)
                        .background(Color.blue)
                    Text("DrawingGroup")
                        .blur(radius: 2)
                }
                .font(.largeTitle)
                .compositingGroup()
                .opacity(1.0)
            }
             .background(Color.white)
             .drawingGroup()
            
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
