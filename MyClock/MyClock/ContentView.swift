//
//  ContentView.swift
//  MyClock
//
//  Created by Igor Ivanov on 14.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var time = Clock(2, 2, 2)
    @State private var duration: Double = 10
    
    
    @State private var selectedHours = 1
    @State private var selectedMinutes = 1
    @State private var selectedSeconds = 1
    @State private var day = 1
    

    
    var bkg: Color {
        if day == 1 {
            return Color.yellow
        }
        return Color.blue
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            let center = CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
            let w = proxy.size.width - 40
            let hourRadius: Double = Double(w * 0.5)
            let minuteRadius: Double = Double(w * 0.4)
            
            bkg.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 32){

                Picker(selection: $selectedHours, label: Text("Часы")) {
                    ForEach(1 ..< 13) {
                        Text("\($0)").tag($0)
                            }
                         }.pickerStyle(MenuPickerStyle())
                .onChange(of: selectedHours, perform: { value in
                    time = Clock(selectedHours+1, selectedMinutes+1, Double(selectedSeconds+1))
                })
                
                Picker(selection: $selectedMinutes, label: Text("Минуты")) {
                    ForEach(1 ..< 61) {
                               Text("\($0)")
                            }
                         }.pickerStyle(MenuPickerStyle())
                .onChange(of: selectedMinutes, perform: { value in
                    time = Clock(selectedHours+1, selectedMinutes+1, Double(selectedSeconds+1))
                })
                
                Picker(selection: $selectedSeconds, label: Text("Секунды")) {
                    ForEach(1 ..< 61) {
                               Text("\($0)")
                            }
                         }.pickerStyle(MenuPickerStyle())
                .onChange(of: selectedSeconds, perform: { value in
                    time = Clock(selectedHours+1, selectedMinutes+1, Double(selectedSeconds+1))
                })
                
                
                ZStack {
                    ClockFace(digitType: .hours, radius: hourRadius, center: center, bkgColor: .gray, foregroundColor: .white, digitSize: 14)
                    
                    ClockFace(digitType: .minutes, radius: minuteRadius, center: center, bkgColor: .clear, foregroundColor: .black, digitSize: 10)
                    
                    ClockShape(clock: time, radius: minuteRadius, center: center)
                        .size(CGSize(width: minuteRadius, height: minuteRadius))
                        .stroke(Color.white, lineWidth: 3)
                        .animation(.easeInOut(duration: duration))
                        .layoutPriority(1)
                }.offset(x: 0, y: -150)
            }
        }.foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
