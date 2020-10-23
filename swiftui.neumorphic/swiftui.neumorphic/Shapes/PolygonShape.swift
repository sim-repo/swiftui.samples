import SwiftUI


struct PolygonView: View {
    
    @State private var sides: Double = 4
    @State private var scale: Double = 1
    
    var body: some View {
        LinearGradient.lairHorizontalLight
            .mask(PolygonShape(sides: sides, scale: scale))
            .frame(width: 150, height: 236)
            .padding(40)
            .font(.system(size: 150, weight: .thin))
            .shadow(color: .white, radius: 2, x: -3, y: -3)
            .shadow(color: .lairShadowGray, radius: 2, x: 3, y: 3)
            .animation(.easeInOut(duration: 2))
            .layoutPriority(1)
    }
}

struct PolygonView_Previews: PreviewProvider {
    static var previews: some View {
        PolygonView()
    }
}

struct PolygonShape: Shape {
    var sides: Double
    var scale: Double
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(sides, scale) }
        set {
            sides = newValue.first
            scale = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        // hypotenuse
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0 * scale
        // center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        var path = Path()
        let extra: Int = sides != Double(Int(sides)) ? 1 : 0
        for i in 0..<Int(sides) + extra {
            let angle = (Double(i) * (360.0 / sides)) * (Double.pi / 180)
            // Calculate vertex
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        
        path.closeSubpath()
        return path
    }
}
