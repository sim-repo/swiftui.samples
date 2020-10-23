//
//  NeumorphicButton5.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//

import SwiftUI



struct NeumorphicButton5: View {
    var bgColor: Color
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        VStack {
            Button("Hello, Neumorphism!", action: {
                self.isPressed.toggle()
            })
            .foregroundColor(.lairShadowGray)
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: self.isPressed ? 7: 10, x: self.isPressed ? 5: -10, y: self.isPressed ? 5: -10)
                        .shadow(color: .black, radius: self.isPressed ? 7: 10, x: self.isPressed ? -5: 10, y: self.isPressed ? -5: 10)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
            )
            .scaleEffect(self.isPressed ? 0.98: 1)
            .foregroundColor(.primary)
            .animation(.spring())
        }
    }
}


struct NeumorphicButton5Style: ButtonStyle {
    var bgColor: Color
    var size: CGSize
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }.frame(width: size.width, height: size.height)
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .animation(.spring())
    }
}
