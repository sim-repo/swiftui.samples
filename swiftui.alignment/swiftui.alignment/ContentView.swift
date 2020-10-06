//
//  ContentView.swift
//  swiftui.alignment
//
//  Created by Igor Ivanov on 06.10.2020.
//

import SwiftUI
//#1:
//struct ContentView: View {
//    var body: some View {
//        HStack(alignment:.bottom) {
//            Star()
//            Title()
//        }
//            .background(Color.gray)// площадь всего HStack
//    }
//}

// #2:
struct ContentView: View {
    var body: some View {
        HStack(alignment:.mid) {
            Star()
            Title()
        }
        .background(Color.gray)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
