//
//  AirplaneViewModel.swift
//  swiftui.followEffect
//
//  Created by Igor Ivanov on 14.10.2020.
//

import Combine
import SwiftUI

class AirplaneViewModel: ObservableObject {
    
    @Published var points:[CGPoint] = [CGPoint(x:0,y:0), CGPoint(x:1,y:1)]
    
    
    let speed: Double = 40
    let minDistanceBetweenPoints: Double = 40
    var segmentsByCheckpoint:[Int:[CGPoint]] = [0:[CGPoint(x:0,y:0), CGPoint(x:1,y:1)]]
    var firstTouchTime: Date = Date(timeIntervalSince1970: 0)
    var curCheckpointIdx: Int = 0
    
    private func tryFixTime(time: Date) {
        if firstTouchTime == Date(timeIntervalSince1970: 0) {
            firstTouchTime = time
        }
    }
    
    
    func didTouch(gesture: DragGesture.Value){
        tryFixTime(time: gesture.time)
        
        let dateComponents = Calendar.current.dateComponents([.nanosecond], from: firstTouchTime, to: gesture.time)
        guard let nano = dateComponents.nanosecond,
              nano > 100000000
        else { return }
        
        let prevCheckpoint = getPrevCheckpoint()
        let pos = CGPoint(x: gesture.translation.width + gesture.startLocation.x,
                          y: gesture.translation.height + gesture.startLocation.y)
        
        guard calcLen(points: [prevCheckpoint, pos]) > minDistanceBetweenPoints else  { return }
        
        firstTouchTime = gesture.time
        addCheckpoint(location: pos)
    }
    
    
    func didStopTouch() {
        firstTouchTime = Date(timeIntervalSince1970: 0)
    }
    
    
    func getPrevCheckpoint() -> CGPoint {
        let lastIdx = segmentsByCheckpoint.count - 1
        if let checkpoints = segmentsByCheckpoint[lastIdx] {
            return checkpoints[1]
        }
        return .zero
    }
    
    
    func addCheckpoint(location: CGPoint) {
        points.append(location)
        let newIdx = segmentsByCheckpoint.count
        var arr: [CGPoint] = []
        let prevCheckpoint = getPrevCheckpoint()
        arr.append(prevCheckpoint)
        arr.append(location)
        segmentsByCheckpoint[newIdx] = arr
    }
    
    
    func getSegmentPoints() -> [CGPoint] {
        return segmentsByCheckpoint[curCheckpointIdx]!
    }
    
    
    func updateCheckpoint(completion: @escaping (Double) -> Void ) {
        if curCheckpointIdx + 1 <= segmentsByCheckpoint.count - 1 {
            curCheckpointIdx += 1
            let fullTime = Double(calcLen(points: getSegmentPoints())) / speed
            completion(fullTime)
        }
    }
    
    
    func CGPointDistance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y))
    }

    
    func calcLen(points:[CGPoint]) -> Double {
        var res: Double = 0

        for (idx,_) in points.enumerated() {
            if idx > 0 {
                let p1 = points[idx - 1]
                let p2 = points[idx]
                res += Double(CGPointDistance(from: p1, to: p2))
            }
        }
        return res
    }
}
