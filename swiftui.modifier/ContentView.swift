//
//  ContentView.swift
//  swiftui.modifier
//
//  Created by Igor Ivanov on 06.10.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("call explicitly modifier")
                .modifier(Title())
            
            Text("call modifier through view extension")
                .titleStyle()
            
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

