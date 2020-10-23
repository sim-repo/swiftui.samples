//
//  HikeView.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 21.10.2020.
//

import SwiftUI


struct BarChartView: View {
    
    @State var dataToShow = \ChartModel.Bar.elevation
    @State private var showDetail = false
    
    var bgColor: Color
    
    @ObservedObject var vm = BarChartVM()
    
    var buttons = [
        ("Elevation", \ChartModel.Bar.elevation),
        ("Heart Rate", \ChartModel.Bar.heartRate),
        ("Pace", \ChartModel.Bar.pace),
    ]
    
    var body: some View {
        ZStack {
            Color.neuBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                BarChartGraph(chartModel: vm.model, path: dataToShow, bgColor: bgColor)
                    .frame(width: 300, height: 100)
                    .transition(.slide)
                
                HStack(spacing: 16) {
                    ForEach(buttons, id: \.0) { value in
                        Button(value.0, action: {
                            withAnimation {
                                self.showDetail.toggle()
                                self.dataToShow = value.1
                            }
                        })
                        .font(.system(size: 13))
                        .frame(width: 120, height: 80)
                        .buttonStyle(NeumorphicButton5Style(bgColor: .neuBackground, size: CGSize(width: 120, height: 80)))
                    }
                }
            }//VStack
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(bgColor: Color.neuBackground)
    }
}
