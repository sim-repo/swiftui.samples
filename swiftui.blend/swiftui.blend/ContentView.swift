//
//  ContentView.swift
//  swiftui.blend
//
//  Created by Igor Ivanov on 07.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
                
                Image("Todt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .saturation(Double(amount))
                    .blur(radius: (1-amount)*20)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
