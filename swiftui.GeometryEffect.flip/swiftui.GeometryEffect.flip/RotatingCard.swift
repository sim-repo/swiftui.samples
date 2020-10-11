//
//  RotatingCard.swift
//  swiftui.GeometryEffect.flip
//
//  Created by Igor Ivanov on 11.10.2020.
//

import SwiftUI

struct RotatingCard: View {
    @State private var flipped = false
    @State private var animate3d = false
    @State private var rotate = false
    @State private var imgIndex = 0
    
    let images = ["ava2", "ava5"]
    
    var body: some View {
        
        // способ вызывать функцию при redraw
        let binding = Binding<Bool>(
            get: { self.flipped },
            set: { self.reconfigSettings($0) }
        )
        
        var angle: Angle {
            return animate3d ? Angle(degrees: 360) : .zero
        }
        
        return VStack {
            Spacer()
            Image(flipped ? "ava4" : images[imgIndex])
                .resizable()
                .frame(width: 300, height: 300)
                .modifier(FlipEffect(flipped: binding, angle: angle, axis: CGPoint(x: 1, y: 5)))
                .rotationEffect(Angle(degrees: rotate ? 0 : 360))
                .onAppear {
                    withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                        self.animate3d = true
                    }
                    
                    withAnimation(Animation.linear(duration: 8.0).repeatForever(autoreverses: false)) {
                        self.rotate = true
                    }
            }
            Spacer()
        }.ignoresSafeArea(.all)
    }
    
    func reconfigSettings(_ value: Bool) {
        // If card was just flipped and at front, change the card
        if flipped != value && !flipped {
            self.imgIndex = self.imgIndex+1 < self.images.count ? self.imgIndex+1 : 0
        }
        flipped = value
    }
}

struct RotatingCard_Previews: PreviewProvider {
    static var previews: some View {
        RotatingCard()
    }
}
