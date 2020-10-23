/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The model for a hike.
 */

import SwiftUI


struct ChartModel {
    var id: Int
    var bars: [Bar]
    
    struct Bar {
        var gradient: LinearGradient
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
