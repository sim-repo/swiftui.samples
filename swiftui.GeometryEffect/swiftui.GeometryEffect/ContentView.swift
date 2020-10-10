//
//  ContentView.swift
//  swiftui.GeometryEffect
//
//  Created by Igor Ivanov on 10.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var startMove = false
    
    var movingOffset: CGFloat {
        return startMove ? CGFloat(Int.random(in: 50...120)) : CGFloat(-1*Int.random(in: 50...120))
    }
    
    var movingFraction: CGFloat {
        return startMove ? 1 : 0
    }
    
    var body: some View {
        let animation = Animation.easeInOut(duration: 1.0)
        
        return VStack {
            
            LabelView("The SwiftUI Lab", movingOffset, movingFraction, .red)
                .animation(animation)
            
//            LabelView("The SwiftUI Lab", movingOffset, movingFraction, .orange)
//                .animation(animation.delay(0.1))
//
//            LabelView("The SwiftUI Lab", movingOffset, movingFraction, .yellow)
//                .animation(animation.delay(0.2))
//
//            LabelView("The SwiftUI Lab", movingOffset, movingFraction, .green)
//                .animation(animation.delay(0.3))
//
//            LabelView("The SwiftUI Lab", movingOffset, movingFraction, .blue)
//                .animation(animation.delay(0.4))
//
//            LabelView("The SwiftUI Lab", movingOffset, movingFraction, .purple)
//                .animation(animation.delay(0.5))
//
//            LabelView("The SwiftUI Lab", movingOffset, movingFraction, .pink)
//                .animation(animation.delay(0.6))
            
            Button(action: { self.startMove.toggle() }) {
                Text("Animate")
            }.padding(.top, 50)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct LabelView: View {
    let text: String
    var offset: CGFloat
    var moveFraction: CGFloat
    let backgroundColor: Color
    
    init(_ text: String, _ offset: CGFloat, _ moveFraction: CGFloat, _ backgroundColor: Color) {
        self.text = text
        self.offset = offset
        self.moveFraction = moveFraction
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        
        Text("The SwiftUI Lab")
            .font(.headline)
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(backgroundColor))
            .foregroundColor(Color.black)
            .modifier(SkewedOffset(offset: offset, moveFraction: moveFraction, goingRight: offset > 0))
        
    }
}



struct SkewedOffset: GeometryEffect {
    
    var offset: CGFloat
    var moveFraction: CGFloat
    let goingRight: Bool
    
    init(offset: CGFloat, moveFraction: CGFloat, goingRight: Bool) {
        self.offset = offset
        self.moveFraction = moveFraction
        self.goingRight = goingRight
        print()
        print("INIT: \(moveFraction)")
        print()
    }
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { return AnimatablePair<CGFloat, CGFloat>(offset, moveFraction) }
        set {
            print("\(newValue.second)")
            offset = newValue.first
            moveFraction = newValue.second
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        var skew: CGFloat
        
        if moveFraction < 0.2 {
            skew = (moveFraction * 5) * 0.5 * (goingRight ? -1 : 1)
        } else if moveFraction > 0.8 {
            skew = ((1 - moveFraction) * 5) * 0.5 * (goingRight ? -1 : 1)
        } else {
            skew = 0.5 * (goingRight ? -1 : 1)
        }
        
        return ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: skew, d: 1, tx: offset, ty: 0))
    }
}

