import SwiftUI





func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}



func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}



struct GraphCapsule: View {
    var index: Int
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var bgColor: Color
    let gradient: LinearGradient
    
    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    
    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    
    
    var body: some View {
        ZStack {
            Capsule()
                .shadow(color: .white, radius: 3, x: -4, y: -4)
                .shadow(color: .black, radius: 3, x: 4, y: 4)
                .blendMode(.overlay)
                .frame(height: height * heightRatio)
                .offset(x: 0, y: height * -offsetRatio)
            
            Capsule()
                .fill(bgColor)
                .frame(height: height * heightRatio)
                .offset(x: 0, y: height * -offsetRatio)

            Capsule()
                .fill(gradient)
                .opacity(0.7)
                .frame(height: height * heightRatio)
                .offset(x: 0, y: height * -offsetRatio)
        }
    }
}
