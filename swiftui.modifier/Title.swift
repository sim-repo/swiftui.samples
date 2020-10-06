//
//  Title.swift
//  swiftui.modifier
//
//  Created by Igor Ivanov on 06.10.2020.
//

import SwiftUI

struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
            .font(.title3)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
