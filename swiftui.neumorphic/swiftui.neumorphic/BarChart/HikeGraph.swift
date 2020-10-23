//
//  HikeGraph.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 21.10.2020.
//

import SwiftUI


extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}


struct BarChartGraph: View {
    var chartModel: ChartModel
    var path: KeyPath<ChartModel.Bar, Range<Double>>
    
    var bgColor: Color
    
    var body: some View {
        let data = chartModel.bars
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: self.path] })
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        let heightRatio = (1 - CGFloat(maxMagnitude / magnitude(of: overallRange))) / 2
        
        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                ForEach(data.indices) { index in
                    GraphCapsule(
                        index: index,
                        height: proxy.size.height,
                        range: data[index][keyPath: self.path],
                        overallRange: overallRange,
                        bgColor: bgColor,
                        gradient: capsuleGradient
                    )
                    .transition(.slide)
                    .animation(.ripple(index: index))
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

struct HikeGraph_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarChartGraph(chartModel: hikeData[0], path: \.elevation, bgColor: Color.neuBackground)
                .frame(height: 200)
            BarChartGraph(chartModel: hikeData[0], path: \.heartRate, bgColor: Color.neuBackground)
                .frame(height: 200)
            BarChartGraph(chartModel: hikeData[0], path: \.pace, bgColor: Color.neuBackground)
                .frame(height: 200)
        }
    }
}

