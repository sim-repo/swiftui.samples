//
//  NeumorphicButton2.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//

import SwiftUI


enum ButtonItemType {
  case mic
  case trash
}


struct NeumorphicButton2: View {
    
    @Binding var selectedItem: ButtonItemType
    
    var imageSystemName: String
    let size: CGFloat
    var type: ButtonItemType
    let action: (()->Void)?
    
    func isSelected() -> Bool {
        return selectedItem == type
    }
    
    var body: some View {
        Button(action: {
            action?()
            selectedItem = type
        }) {
            if isSelected() {
                buttonDown
            } else {
                buttonUp
            }
        }
    }
    
    var buttonUp: some View {
        
        var buttonMask: some View {
          ZStack {
            Rectangle()
              .foregroundColor(.white)
              .frame(width: size * 2, height: size * 2)
            
            Image(systemName: self.imageSystemName)
              .resizable()
              .scaledToFit()
              .frame(width: size, height: size)
          }
        }
        
        return ZStack {
            
            //left top shadow
            Rectangle()
                .foregroundColor(.lairBackgroundGray)
                .frame(width: size * 1.9, height: size * 1.9)
                .cornerRadius(size * 8 / 16)
            
            // button surface
            Rectangle()
                .foregroundColor(.lairWhite)
                .frame(width: size * 1.9, height: size * 1.9)
                .cornerRadius(size * 8 / 16)
                .mask(Rectangle()
                                .cornerRadius(size * 6 / 16)
                                .padding(size / 8)
                )
                .shadow(
                    color: Color.lairShadowGray.opacity(0.7),
                    radius: size * 0.1875,
                    x: size * 0.1875, y: size * 0.1875)
                .shadow(
                    color: Color(white: 1.0).opacity(0.9),
                    radius: size * 0.1875,
                    x: -size * 0.1875, y: -size * 0.1875)
                .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
            
            // icon
            Rectangle()
              .inverseMask(buttonMask)
                .frame(width: size * 1.6 , height: size * 1.6)
              .foregroundColor(.lairWhite)
                .shadow(
                    color: Color.lairGray,
                    radius: size * 0.1875,
                    x: size * 0.1875, y: size * 0.1875)
                .shadow(
                    color: Color(white: 1.0).opacity(0.9),
                    radius: size * 0.1875,
                    x: -size * 0.1875, y: -size * 0.1875)
                .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
        }
        .overlay(
            RoundedRectangle(cornerRadius: size * 8 / 16)
                .stroke(LinearGradient.lairDiagonalLightBorder, lineWidth: 1)
        )
    }
    
    
    var buttonDown: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.lairBackgroundGray)
                .frame(width: size * 1.9, height: size * 1.9)
                .cornerRadius(size * 8 / 16)
            
            Rectangle()
                .foregroundColor(.lairBackgroundGray)
                .frame(width: size * 1.9, height: size * 1.9)
                .cornerRadius(size * 8 / 16)
                .inverseMask(Rectangle()
                                .cornerRadius(size * 6 / 16)
                                .padding(size / 8)
                )
                .shadow(
                    color: Color.lairShadowGray.opacity(0.7),
                    radius: size * 0.1875,
                    x: size * 0.1875, y: size * 0.1875)
                .shadow(
                    color: Color(white: 1.0).opacity(0.9),
                    radius: size * 0.1875,
                    x: -size * 0.1875, y: -size * 0.1875)
                .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
            
            LinearGradient.lairHorizontalDarkReverse
                .frame(width: size, height: size)
                .mask(Image(systemName: imageSystemName)
                        .resizable()
                        .scaledToFit()
                )
                .shadow(
                    color: Color.lairShadowGray.opacity(0.5),
                    radius: size * 0.1875,
                    x: size * 0.1875, y: size * 0.1875)
                .shadow(
                    color: Color(white: 1.0).opacity(0.9),
                    radius: size * 0.1875,
                    x: -size * 0.1875, y: -size * 0.1875)
        }
        .overlay(
            RoundedRectangle(cornerRadius: size * 8 / 16)
                .stroke(LinearGradient.lairHorizontalDarkToLight, lineWidth: 2)
        )
    }
}

struct NeumorphicButton2_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicButton2(selectedItem: .constant(.mic), imageSystemName: "mic", size: 40, type: .trash, action: nil)
    }
}
