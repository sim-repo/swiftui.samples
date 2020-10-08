//
//  ContentView.swift
//  swiftui.viewbuilder.notification
//
//  Created by Igor Ivanov on 08.10.2020.
//

import SwiftUI

extension AnyTransition {
    
    static var moveInsideOutside: AnyTransition {
        return AnyTransition
            .move(edge: .trailing)
            .combined(with: offset(x: 1000, y: 0))
    }
    
    static var appearAndFade: AnyTransition {
        let insertion = AnyTransition
            .move(edge: .top)
            .combined(with: .scale(scale: 0.2, anchor: .topTrailing))
        
        let removal = AnyTransition.scale
            .combined(with: opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var falling: AnyTransition {
        return AnyTransition
            .move(edge: .top)
            .combined(with: offset(x: 0, y: -300))
    }
}


struct ContentView: View {
    @State private var notificationShown = false
    let moonAnimation = Animation.easeInOut.repeatForever(autoreverses: true)
    
    var body: some View {
        VStack {
            if self.notificationShown {
                NotificationView {
                    Text("notification")
                    Text("notification")
                    Text("notification")
                }.transition(.falling)
                
            }
            
            Button("toggle") {
                withAnimation(.easeIn(duration: 0.5)) {
                    self.notificationShown.toggle()
                }
            }
            
            Image(systemName: "moon.circle.fill")
              .rotationEffect(.degrees(self.notificationShown ? -50 : 0))
              .scaleEffect(self.notificationShown ? 2 : 1)
              .animation(moonAnimation)
        }
    }
}


struct NotificationView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color.blue)
            .cornerRadius(16)
    }
    
    func animation(index: Double) -> Animation {
      return Animation.spring(dampingFraction: 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
