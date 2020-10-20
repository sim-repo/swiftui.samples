//
//  ColorfulBackground.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//
import SwiftUI

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                    shape
                        .fill(Color.lightStart)
                        .overlay(shape.stroke(LinearGradient(Color.darkStart, Color.darkEnd),
                                              lineWidth: 0.7))
                        .shadow(color: Color.darkStart, radius: 5, x: 5, y: 5)
                        .shadow(color: Color.darkEnd, radius: 5, x: -5, y: -5)
                } else {
                    shape
                        .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                        .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 0.7))
                        .shadow(color: Color.darkStart, radius: 5, x: -5, y: -5)
                        .shadow(color: Color.darkEnd, radius: 5, x: 5, y: 5)
                }
        }
    }
}
