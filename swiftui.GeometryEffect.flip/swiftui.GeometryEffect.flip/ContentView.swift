//
//  ContentView.swift
//  swiftui.GeometryEffect.flip
//
//  Created by Igor Ivanov on 11.10.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
                    Spacer()
                    RotatingCard()
                    Spacer()
                    }.background(Color.black).navigationBarTitle("Example 8")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
