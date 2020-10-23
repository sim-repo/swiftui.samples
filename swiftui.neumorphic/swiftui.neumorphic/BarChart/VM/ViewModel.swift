//
//  ViewModel.swift
//  swiftui.neumorphic
//
//  Created by Igor Ivanov on 23.10.2020.
//

import SwiftUI



class BarChartVM: ObservableObject {
    @Published var model: ChartModel
    
    private var timer: Timer?
    private var colorCount: Double = 0
    
    init() {
        model = generateChart()
        startChangingModel()
    }
    
    private func startChangingModel() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeModel), userInfo: nil, repeats: true)
    }
    
    @objc func changeModel() {
        let tmp = model.bars.dropFirst()
        model.bars = Array(tmp)
        let ranges = generateRanges()
        let newBar = ChartModel.Bar(gradient: getGradient(), elevation: ranges[0], pace: ranges[1], heartRate: ranges[2])
        colorCount = colorCount > 10 ? 0 : colorCount + 1
        model.bars.append(newBar)
    }
    
    
    func getGradient() -> LinearGradient{
        let K: Double = 30*(1-colorCount/10)
        var color1 = Color(red: (164+K)/255, green: (208+K)/255, blue: (119+K)/255, opacity: 1)
        var color2 = Color(red: 95/255, green: 171/255, blue: 242/255, opacity: 1)
        
        if colorCount == 10 {
            color1 = Color( #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) )
            color2 = Color( #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) )
        }
        return LinearGradient(
            gradient: Gradient(colors: [ color1, color2 ]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

let highest: Int = 500
let lowest: Int = 100

func generateRanges() -> [Range<Double>] {
    let lowElevation: Double = Double(Int.random(in: lowest...highest))
    let highElevation: Double = Double(Int.random(in: 1...300)) + lowElevation
    
    let lowPace: Double = Double(Int.random(in: lowest...highest))
    let highPace: Double = Double(Int.random(in: 1...300)) + lowPace
    
    let lowHeartRate: Double = Double(Int.random(in: lowest...highest))
    let highHeartRate: Double = Double(Int.random(in: 1...300)) + lowHeartRate
    
    return [
        lowElevation..<highElevation,
        lowPace..<highPace,
        lowHeartRate..<highHeartRate
    ]
}



func generateChart() -> ChartModel {
    var bars: [ChartModel.Bar] = []
    for _ in 0...12 {
        let lowElevation: Double = Double(Int.random(in: lowest...highest))
        let highElevation: Double = Double(Int.random(in: 1...300)) + lowElevation
        
        let lowPace: Double = Double(Int.random(in: lowest...highest))
        let highPace: Double = Double(Int.random(in: 1...300)) + lowPace
        
        let lowHeartRate: Double = Double(Int.random(in: lowest...highest))
        let highHeartRate: Double = Double(Int.random(in: 1...300)) + lowHeartRate
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [ Color( #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) ), Color( #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) ) ]),
            startPoint: .top,
            endPoint: .bottom
        )
        
        bars.append(ChartModel.Bar(gradient: gradient, elevation: lowElevation..<highElevation, pace: lowPace..<highPace, heartRate: lowHeartRate..<highHeartRate))
    }
    return ChartModel(id: 0, bars: bars)
}
