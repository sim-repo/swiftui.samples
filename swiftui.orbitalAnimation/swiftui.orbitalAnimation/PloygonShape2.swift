//
//  PloygonShape2.swift
//  swiftui.orbitalAnimation
//
//  Created by Igor Ivanov on 08.10.2020.
//

import SwiftUI

// https://swiftui-lab.com/trigonometric-recipes-for-swiftui/

struct PolygonShape2: Shape {
    
    var sides: Double
       
       var animatableData: Double {
           get { return sides }
           set { sides = newValue }
       }
       
       func path(in rect: CGRect) -> Path {
           
           // hypotenuse
           let h = Double(min(rect.size.width, rect.size.height)) / 2.0
           
           // center
           let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
           
           var path = Path()
           
           let extra: Int = Double(sides) != Double(Int(sides)) ? 1 : 0
           
           for i in 0..<Int(sides) + extra {
               let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
               
               // Calculate vertex
               let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
               
               if i == 0 {
                   path.move(to: pt) // move to first vertex
               } else {
                   path.addLine(to: pt) // draw line to next vertex
               }
           }
           
           path.closeSubpath()
           
           return path
       }
}


struct PolygonView2: View {
    @State private var sides: Double = 4
        @State private var duration: Double = 1.0
        
        var body: some View {
            VStack {
                PolygonShape2(sides: sides)
                    .stroke(Color.red, lineWidth: 3)
                    .padding(20)
                    .animation(.easeInOut(duration: duration))
                    .layoutPriority(1)
                
                Text("\(Int(sides)) sides").font(.headline)
                
                HStack(spacing: 20) {
                    MyButton(label: "1") {
                        self.sides = 1
                    }
                    
                    MyButton(label: "3") {
                        self.sides = 3
                    }
                    
                    MyButton(label: "7") {
                        self.sides = 7
                    }
                    
                    MyButton(label: "30") {
                        self.sides = 30
                    }
                    
                }.navigationBarTitle("Example 2").padding(.bottom, 50)
            }
        }
}


struct MyButton: View {
    let label: String
    var font: Font = .title
    var textColor: Color = .white
    let action: () -> ()
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(label)
                .font(font)
                .padding(10)
                .frame(width: 70)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue).shadow(radius: 2))
                .foregroundColor(textColor)
            
        })
    }
}
