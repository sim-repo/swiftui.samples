//
//  PolygonShape.swift
//  swiftui.orbitalAnimation
//
//  Created by Igor Ivanov on 08.10.2020.
//

import SwiftUI

// https://swiftui-lab.com/trigonometric-recipes-for-swiftui/

struct PolygonShape: Shape {
    var sides: Int
    
    func path(in rect: CGRect) -> Path {
        // hypotenuse
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        
        // center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        
        var path = Path()
                
        for i in 0..<sides {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180

            // Calculate vertex position
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





struct PolygonView: View {
    @State private var step: CGFloat = 0.03
    
    let maxVertex: CGFloat = 20
    
    let gradient1 = LinearGradient(gradient: Gradient(colors: [ Color.init(#colorLiteral(red: 0, green: 0.8318514228, blue: 0, alpha: 1)) , Color.init(#colorLiteral(red: 0, green: 0.8850890994, blue: 0.5420010686, alpha: 1)) ]), startPoint: .leading, endPoint: .bottom)
    
    let gradient2 = LinearGradient(gradient: Gradient(colors: [ Color.init(#colorLiteral(red: 0, green: 0.8321115971, blue: 0.7371535897, alpha: 1)) , Color.init(#colorLiteral(red: 0, green: 0.6135160327, blue: 0.8930738568, alpha: 1)) ]), startPoint: .leading, endPoint: .bottom)
    
    var isEven: Bool {
        Int(maxVertex*step).isMultiple(of: 2)
    }
    
    var angle: Double {
        return 360*Double(step)
    }
    
    var body: some View {
        VStack {
        PolygonShape(sides: Int(maxVertex*step))
            .fill(isEven ? gradient1 : gradient2)
            .scaleEffect(isEven ? 0.8: 1)
            .rotationEffect(.degrees(angle), anchor: .center)
            .animation(.easeInOut(duration: 0.2))
        
        Text("\(step)")
        
            Slider(value: withAnimation {$step})
            .padding()
        }.background(Color.black)
        .ignoresSafeArea(.all)
    }
}
