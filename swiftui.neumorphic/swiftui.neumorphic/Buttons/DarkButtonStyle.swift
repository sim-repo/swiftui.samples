//
//  DarkNeumorphicButton.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//

import SwiftUI

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
            )
    }
}
