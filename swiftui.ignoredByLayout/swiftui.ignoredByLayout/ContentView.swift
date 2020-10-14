//
//  ContentView.swift
//  swiftui.ignoredByLayout
//
//  Created by Igor Ivanov on 14.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.green)
                .frame(width: 300, height: 50)
                .overlay(ShowSize(name: "one"))
                .modifier(MyEffect(x: animate ? -10 : 10, name: "Effect1"))
            
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.blue)
                .frame(width: 300, height: 50)
                .overlay(ShowSize(name: "two"))
                .modifier(MyEffect(x: animate ? 10 : -10, name: "Effect2")
                            .ignoredByLayout()) // draw у ShowSize при анимации НЕ будет вызываться
            
        }
        .onAppear { //  вызовет пересоздание обьектов RoundedRectangle, ShowSize, MyEffect второй раз
            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                self.animate = true
            }
        }
    }
}

struct MyEffect: GeometryEffect {
    var name: String
    var x: CGFloat = 0
    
    init(x: CGFloat, name: String){
        self.x = x
        self.name = name
        print("\(name)")
    }
    
    var animatableData: CGFloat {
        get { x }
        set { x = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(translationX: x, y: 0))
    }
}

struct ShowSize: View {
    var name: String
    
    init(name: String){
        self.name = name
        print("\(name)")
    }
    
    var body: some View {
        GeometryReader { proxy in
            Text("x = \(Int(proxy.frame(in: .global).minX))")
                .foregroundColor(.white)
            
            Text(name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
