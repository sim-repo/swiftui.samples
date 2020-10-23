//
//  ColorfulButtonStyle.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//

import SwiftUI

struct ColorfulButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(RoundedRectangle(cornerRadius: 20))
            .background(
                ColorfulBackground(isHighlighted: configuration.isPressed, shape: RoundedRectangle(cornerRadius: 20))
            )
            .animation(nil)
    }
}

