//
//  ContentView.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 20.10.2020.
//

import SwiftUI





//BAR CHART
struct ContentView: View {
    var body: some View {
        BarChartView(bgColor: Color.neuBackground)
            .foregroundColor(.gray)
    }
}


//struct ContentView: View {
//    var body: some View {
//
//        ZStack {
////            NeumorphicButton5(bgColor: Color.neuBackground )
////                .frame(maxWidth: .infinity,
////                            maxHeight: .infinity)
////                            .background(Color.neuBackground)
////                            .edgesIgnoringSafeArea(.all)
////
////
//            Color.neuBackground
//
//            Button("Neumorphic", action: {
//            }).buttonStyle(NeumorphicButton5Style(bgColor: .neuBackground))
//        }
//    }
//}



// DARK THEME
//struct ContentView: View {
//    var body: some View {
//                DarkNeumorphicButton(bgColor: Color.init(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) )
//                    .frame(maxWidth: .infinity,
//                                maxHeight: .infinity)
//                                .background(Color.init(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
//                                .edgesIgnoringSafeArea(.all)
//    }
//}




//
//struct ContentView: View {
//    @State var selectedItem: ButtonItemType = .mic
//    var body: some View {
//
//        ZStack {
//            Color.offWhite
//
//            RoundedRectangle(cornerRadius: 25)
//                .fill(Color.offWhite)
//                .frame(width: 300, height: 300)
//                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
//                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
//
//
//            VStack(spacing: 32) {
//
//                Button(action: {}) {
//                    Image(systemName: "mic")
//                        .foregroundColor(.gray)
//                }
//                .buttonStyle(SimpleButtonStyle())
//
//                HStack(spacing: 32) {
//                    NeumorphicButton2(selectedItem: $selectedItem, imageSystemName: "mic", size: 40, type: .mic, gradientNormal: .lairDiagonalLightBorder, gradientWhenPressed: .lairHorizontalDarkToLight, action: nil)
//
//                    NeumorphicButton2(selectedItem: $selectedItem, imageSystemName: "trash", size: 40, type: .trash, gradientNormal: .lairDiagonalLightBorder, gradientWhenPressed: .lairHorizontalDarkToLight,action: nil)
//                }
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//
//    }
//}

// DARK THEME
//struct ContentView: View {
//
//    @State var selectedItem: ButtonItemType = .mic
//    @State private var isToggled = false
//
//    var body: some View {
//
//        ZStack {
//            LinearGradient(Color.darkStart, Color.darkEnd)
//
//            VStack(spacing: 32) {
//
//                Button(action: {}) {
//                    Image(systemName: "mic")
//                        .foregroundColor(.gray)
//                }
//                .buttonStyle(DarkButtonStyle())
//
//                Toggle(isOn: $isToggled) {
//                                   Image(systemName: "mic")
//                                       .foregroundColor(.white)
//                               }
//                               .toggleStyle(DarkToggleStyle())
//
//
//                Button(action: {
//                    print("Button tapped")
//                }) {
//                    Image(systemName: "mic")
//                        .foregroundColor(.white)
//                }
//                .buttonStyle(ColorfulButtonStyle())
//
//
//
//                Toggle(isOn: $isToggled) {
//                    Image(systemName: "mic")
//                        .foregroundColor(.white)
//                }
//                .toggleStyle(ColorfulToggleStyle())
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
