//
//  HikeGraph.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 21.10.2020.
//

import SwiftUI


extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.8)
            .speed(0.5)
            .delay(0.03 * Double(index))
    }
}


struct BarChartGraph: View {
    var chartModel: ChartModel
    var path: KeyPath<ChartModel.Bar, Range<Double>>
    
    var bgColor: Color
    
    var body: some View {
        let data = chartModel.bars
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        let heightRatio = (1 - CGFloat(maxMagnitude / magnitude(of: overallRange))) / 2
        
        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                ForEach(data.indices) { index in
                    GraphCapsule(
                        index: index,
                        height: proxy.size.height,
                        range: data[index][keyPath: path],
                        overallRange: overallRange,
                        bgColor: bgColor,
                        gradient: data[index].gradient
                    )
                    .animation(.ripple(index: index))
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

