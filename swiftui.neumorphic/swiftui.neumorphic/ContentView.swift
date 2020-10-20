//
//  ContentView.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//

import SwiftUI

//struct ContentView: View {
//    @State var selectedItem: ButtonItemType = .mic
//    var body: some View {
//
//        ZStack {
//            Color.offWhite
//
//            RoundedRectangle(cornerRadius: 25)
//                .fill(Color.offWhite)
//                .frame(width: 300, height: 300)
//                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
//                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
//
//
//            VStack(spacing: 32) {
//                Button(action: {}) {
//                    Image(systemName: "mic")
//                        .foregroundColor(.gray)
//                }
//                .buttonStyle(SimpleButtonStyle())
//
//                NeumorphicButton2(selectedItem: $selectedItem, imageSystemName: "mic", size: 40, type: .mic, action: nil)
//
//                NeumorphicButton2(selectedItem: $selectedItem, imageSystemName: "trash", size: 40, type: .trash, action: nil)
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//
//    }
//}

// DARK THEME
struct ContentView: View {
    @State var selectedItem: ButtonItemType = .mic
    
    @State private var isToggled = false
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)

            VStack(spacing: 32) {
                Button(action: {}) {
                    Image(systemName: "mic")
                        .foregroundColor(.gray)
                }
                .buttonStyle(DarkButtonStyle())
                
                Toggle(isOn: $isToggled) {
                                   Image(systemName: "mic")
                                       .foregroundColor(.white)
                               }
                               .toggleStyle(DarkToggleStyle())
                
                
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Image(systemName: "mic")
                        .foregroundColor(.white)
                }
                .buttonStyle(ColorfulButtonStyle())
                
                
                
                Toggle(isOn: $isToggled) {
                    Image(systemName: "mic")
                        .foregroundColor(.white)
                }
                .toggleStyle(ColorfulToggleStyle())
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
