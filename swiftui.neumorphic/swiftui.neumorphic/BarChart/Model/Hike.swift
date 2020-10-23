/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The model for a hike.
 */

import SwiftUI

let hikeData: [ChartModel] = generateHikes()

func generateHikes() -> [ChartModel] {
    var result = [ChartModel]()
    for idx in 0...10 {
        var observations: [ChartModel.Bar] = []
        for _ in 0...5 {
            let lowElevation: Double = Double(Int.random(in: 100...400))
            let highElevation: Double = Double(Int.random(in: 1...300)) + lowElevation
            
            let lowPace: Double = Double(Int.random(in: 100...400))
            let highPace: Double = Double(Int.random(in: 1...300)) + lowPace
            
            let lowHeartRate: Double = Double(Int.random(in: 100...400))
            let highHeartRate: Double = Double(Int.random(in: 1...300)) + lowHeartRate
            
            observations.append(ChartModel.Bar(elevation: lowElevation..<highElevation, pace: lowPace..<highPace, heartRate: lowHeartRate..<highHeartRate))
        }
        result.append(ChartModel(id: idx, observations: observations))
    }
    return result
}



struct ChartModel {
    var id: Int
    var observations: [Bar]
    
    struct Bar {
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
