//
//  NeumorphicButton4.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//

import SwiftUI

//https://sarunw.com/posts/how-to-create-neomorphism-design-in-swiftui/
extension Color {
    static let neuBackground = Color(hex: "f0f0f3")
    static let dropShadow = Color(hex: "aeaec0").opacity(0.4)
    static let dropLight = Color(hex: "ffffff")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}


struct DarkNeumorphicButton: View {
    var bgColor: Color
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        VStack {
            Button("Hello, Neumorphism!", action: {
                self.isPressed.toggle()
            })
            .foregroundColor(.white)
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: Color.init(white: 1, opacity: 0.2), radius: self.isPressed ? 2: 3, x: self.isPressed ? 1: -3, y: self.isPressed ? 1: -3)
                        .shadow(color: Color.init(white: 0, opacity: 0.5), radius: self.isPressed ? 2: 3, x: self.isPressed ? -1: 3, y: self.isPressed ? -1: 3)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.blue, lineWidth: 0.3)
                        )
                }
            )
            .scaleEffect(self.isPressed ? 0.98: 1)
            .foregroundColor(.primary)
            .animation(.spring())
        }
    }
}

struct DarkNeumorphicButton_Previews: PreviewProvider {
    static var previews: some View {
        DarkNeumorphicButton(bgColor: Color.gray)
    }
}
