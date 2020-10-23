//
//  ColorfulToggleStyle.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//

import SwiftUI

struct ColorfulToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            ColorfulBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
    }
}
