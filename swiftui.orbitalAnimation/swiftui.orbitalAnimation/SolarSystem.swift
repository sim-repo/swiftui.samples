//
//  SolarSystem.swift
//  swiftui.orbitalAnimation
//
//  Created by Igor Ivanov on 08.10.2020.
//

import SwiftUI

struct SolarSystem: View {
    @State private var param1 = false
    @State private var param2 = false
    
    
    var body: some View {
        Image(systemName: "flame")
            .resizable()
            .scaleEffect(param1 ? 1.0 : 1.0)
            .frame(width: 300, height: 300)
            .animation(.easeInOut(duration: 1.0))
            .onTapGesture{
                self.param1.toggle()
            }
    }
}

struct SolarSystem_Previews: PreviewProvider {
    static var previews: some View {
        SolarSystem()
    }
}
