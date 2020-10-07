//
//  ContentView.swift
//  swiftui.animation.animatablepair
//
//  Created by Igor Ivanov on 07.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rows = 4
    @State private var columns = 4
    
    @State private var insetAmount: CGFloat = 50
    
    
    var body: some View {
        Checkboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)){
                    self.rows = 8
                    self.columns = 16
                }
            }
        
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
