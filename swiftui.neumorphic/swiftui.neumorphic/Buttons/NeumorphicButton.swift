//
//  NeumorphicButtons.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//

import SwiftUI

struct NeumorphicButton: View {
    var imageSystemName: String
    var size: CGFloat
    var action: (()->Void)?
    var body: some View {
        Button(action: {
            action?()
        }){
            Image(systemName: imageSystemName)
                .resizable()
                .frame(width: size, height: size)
                .padding(25)
                .foregroundColor(Color.gray)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke( Color.init(#colorLiteral(red: 0.8806594014, green: 0.8936877847, blue: 0.8932924867, alpha: 1)) , lineWidth: 6)
                        .shadow(color: .white, radius: 3, x: 5, y: 5)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                        .shadow(color: .lairShadowGray, radius: 2, x: -2, y: -2)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                )
                .background(LinearGradient.lairHorizontalLight)
                .cornerRadius(10)
        }
    }
}

struct NeumorphicButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicButton(imageSystemName: "message", size: 40, action: nil)
    }
}
