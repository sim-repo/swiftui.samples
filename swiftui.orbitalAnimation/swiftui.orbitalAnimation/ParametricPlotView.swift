//
//  DataPlotView.swift
//  swiftui.orbitalAnimation
//
//  Created by Igor Ivanov on 08.10.2020.
//

import SwiftUI


import SwiftUI

extension AnyTransition {
    
    static var moveInsideOutside: AnyTransition {
        return AnyTransition
            .move(edge: .trailing)
            .combined(with: offset(x: 496, y: 0))
    }
}


struct DataPlotView: View {
    
    @State var R1: CGFloat = 60
    @State var omega1: CGFloat = 2.66
    @State var k1: CGFloat = 0.1023
    
    @State var R2: CGFloat = 47
    @State var omega2: CGFloat = 0.102
    @State var k2: CGFloat = -0.012
    
    @State var fi: CGFloat = 1.2
    @State var Kfi: CGFloat = 0.008
    
    
    @State private var slidersShown = false
    @State private var colorsShown = true
    
    @State private var red1: Double = 0
    @State private var green1: Double = 0
    @State private var blue1: Double = 0
    
    @State private var red2: Double = 0
    @State private var green2: Double = 0
    @State private var blue2: Double = 0
    
    
    var color1: Color {
        return Color.init(red: red1, green: green1, blue: blue1, opacity: 1)
    }
    
    var color2: Color {
        return Color.init(red: red2, green: green2, blue: blue2, opacity: 1)
    }
    
    var body: some View {
        ZStack {
            
            PlotView(R1: R1,
                     omega1: omega1,
                     k1: k1,
                     R2: R2,
                     omega2: omega2,
                     k2: k2,
                     fi: fi,
                     Kfi: Kfi,
                     color1: color1,
                     color2: color2
                     )
                
                .drawingGroup()

            VStack(alignment: .leading, spacing: 0) {
                
                if self.slidersShown {
                    VStack {
                        Spacer()
                        VStack(alignment: .center, spacing: 0) {
                            Text("Радиус 1: \(R1)")
                            Slider(value: $R1, in: 0...2800, step: 1).scaleEffect(0.5)
                            
                            Text("Спирали 1: \(omega1)")
                            Slider(value: $omega1, in: 0...40, step: 0.01).scaleEffect(0.5)
                            
                            Text("Глубина Спирали 1: \(k1)")
                            Slider(value: $k1, in: 0...30).scaleEffect(0.5)
                            
                            Text("R2: \(R2)")
                            Slider(value: $R2, in: 0...100).scaleEffect(0.5)
                            
                            Text("omega2: \(omega2)")
                            Slider(value: $omega2, in: 0...40, step: 0.01).scaleEffect(0.5)
                        }
                        
                        VStack(alignment: .center, spacing: 0) {
                            Text("fi: \(fi)")
                            Slider(value: $fi, in: 0...40, step: 0.01).scaleEffect(0.5)
                            
                            Text("Kfi: \(Kfi)")
                            Slider(value: $Kfi, in: 0...40, step: 0.01).scaleEffect(0.5)
                        }
                    }.transition(.moveInsideOutside)
                }
                
                
                if self.colorsShown {
                    VStack {
                        Spacer()
                        Slider(value: $red1, in: 0...1, step: 0.01).scaleEffect(0.5)
                        Slider(value: $green1, in: 0...1, step: 0.01).scaleEffect(0.5)
                        Slider(value: $blue1, in: 0...1, step: 0.01).scaleEffect(0.5)
    
                        Slider(value: $red2, in: 0...1, step: 0.01).scaleEffect(0.5)
                        Slider(value: $green2, in: 0...1, step: 0.01).scaleEffect(0.5)
                        Slider(value: $blue2, in: 0...1, step: 0.01).scaleEffect(0.5)
                    }.transition(.moveInsideOutside)
                }
                
                Spacer()
                HStack {
                    Button("controls") {
                        withAnimation(.easeIn(duration: 0.5)) {
                            slidersShown.toggle()
                            if colorsShown {
                                colorsShown.toggle()
                            }
                        }
                    }
                    
                    Button("colors") {
                        withAnimation(.easeIn(duration: 0.5)) {
                            colorsShown.toggle()
                            if slidersShown {
                               slidersShown.toggle()
                            }
                        }
                    }
                
                }.padding()
            }
            .opacity(0.8)
            .foregroundColor(.white)
            .font(Font.system(size:10))
        }
        .background(Color.black)
    }
}

struct DataPlotView_Previews: PreviewProvider {
    static var previews: some View {
        DataPlotView()
    }
}




struct Colors {
    let red: Double
    let green: Double
    let blue: Double
}

struct PlotView: View {
    
    var R1: CGFloat
    var omega1: CGFloat
    var k1: CGFloat
    
    var R2: CGFloat
    var omega2: CGFloat
    var k2: CGFloat
    
    
    var fi: CGFloat
    var Kfi: CGFloat
    
    var color1: Color
    var color2: Color
  
    @State private var animate = false
    
    
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let midX: CGFloat = geometry.size.width / 2
                let midY: CGFloat = geometry.size.height / 2
                
                let params: PlotParams = PlotParams(R1: R1, omega1: omega1, k1: k1, R2: R2, omega2: omega2, k2: k2, fi: fi, Kfi: Kfi)
                
                let points: [CGPoint] = fillPlotPoints(params: params)
                
                
                for (idx,point) in points.enumerated() {
                    
                    let point = CGPoint(x: midX + point.x, y: midY + point.y)
                    if idx == 0 {
                        path.move(to: point)
                    } else {
                        path.addLine(to: point )
                    }
                }
            }.stroke(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing))
            .rotationEffect(Angle(degrees: animate ? 0 : 100000))
            .onAppear {
                withAnimation(Animation.linear(duration: 1000.0).repeatForever()) {
                    self.animate = true
                }
            }

        }
    }
}


struct PlotParams {
    let R1: CGFloat
    let omega1: CGFloat
    let k1: CGFloat
    
    let R2: CGFloat
    let omega2: CGFloat
    let k2: CGFloat
    
    let fi: CGFloat
    let Kfi: CGFloat
}

func fillPlotPoints(params: PlotParams) -> [CGPoint] {
    
    let R1: CGFloat = params.R1
    let omega1: CGFloat = params.omega1
    let k1: CGFloat = params.k1
    
    let R2: CGFloat = params.R2
    let omega2: CGFloat = params.omega2
    let k2: CGFloat = params.k2
    
    let fi: CGFloat = params.fi
    let Kfi: CGFloat = params.Kfi
    
    var points: [CGPoint] = []
    
    
    for t in stride(from: -3, to: 3, by: 0.01) {
        
        let tt = CGFloat(t)
        
        let xCos: CGFloat = cos(2 * .pi * omega1 * tt)
        let x11: CGFloat = R1 * xCos * exp(k1 * tt)
        
        
        let xSin: CGFloat = sin(2 * .pi * omega2 * tt + fi * exp(Kfi * tt ))
        let x12: CGFloat = R2 * xSin * exp(k2*tt)
        
        let x = x11 + x12
        
        
        
        let ySin: CGFloat = sin(2 * .pi * omega1 * tt)
        let y11 = R1 * ySin * exp(k1 * tt)
        
        let yCos: CGFloat = cos(2 * .pi * omega2 * tt + fi * exp(Kfi * tt ))
        let y12 = R2 * yCos * exp(k2*tt)
        
        let y =  y11 + y12
        points.append(CGPoint(x: x, y: y))
    }
    return points
    
}



func corridorPlot(i: Int) -> PlotParams {
    if i == 0 {
        return PlotParams(R1: 49.829, omega1: 9.0614, k1: 0.204778, R2: 0, omega2: 0.051195, k2: -0.012, fi: 1.2, Kfi: 0.008)
    }
    
    if i == 1 {
        return PlotParams(R1: 30, omega1: 11, k1: 0.25, R2: 92, omega2: 0.07, k2: -0.012, fi: 1.2, Kfi: 0.008)
    }
    
    if i == 2 {
        return PlotParams(R1: 0, omega1: 14, k1: 0.3583, R2: 95.9, omega2: 0.2, k2: -0.012, fi: 1.2, Kfi: 0.008)
    }
    
    if i == 3 {
        return PlotParams(R1: 0, omega1: 33, k1: 0.3583, R2: 95.9, omega2: 0.2, k2: -0.012, fi: 1.2, Kfi: 0.008)
    }
    
    if i == 4 {
        return PlotParams(R1: 0, omega1: 22.25, k1: 2.3, R2: 95.9, omega2: 0.2, k2: -0.012, fi: 1.2, Kfi: 0.008)
    }
    
    if i == 5 {
        return PlotParams(R1: 0, omega1: 25, k1: 2.66, R2: 100, omega2: 0.2, k2: -0.012, fi: 1.2, Kfi: 0.008)
    }
    
    if i == 6 {
        return PlotParams(R1: 81, omega1: 1.98, k1: 0.46, R2: 0, omega2: 18.36, k2: -0.012, fi: 0, Kfi: 0)
    }
    
    return PlotParams(R1: 0, omega1: 0, k1: 0, R2: 0, omega2: 0, k2: 0, fi: 0, Kfi: 0)
}


func flowerPlot(i: Int) -> PlotParams {
    if i == 0 {
        return PlotParams(R1: 62, omega1: 25, k1: 0, R2: 100, omega2: 12.63, k2: -0.012, fi: 26.28, Kfi: 0)
    }
    
    if i == 1 {
        return PlotParams(R1: 62, omega1: 25, k1: 0, R2: 100, omega2: 14.95, k2: -0.012, fi: 26.28, Kfi: 0)
    }
    
    if i == 2 {
        return PlotParams(R1: 62, omega1: 25, k1: 0, R2: 100, omega2: 16.72, k2: -0.012, fi: 26.28, Kfi: 0)
    }
    
    if i == 3 {
        return PlotParams(R1: 62, omega1: 24.91, k1: 0, R2: 100, omega2: 25.19, k2: -0.012, fi: 0, Kfi: 0)
    }
    
    if i == 4 {
        return PlotParams(R1: 1.14, omega1: 3.07, k1: 0, R2: 67.7474, omega2: 6.08, k2: -0.012, fi: 0, Kfi: 0)
    }
    
    return PlotParams(R1: 0, omega1: 0, k1: 0, R2: 0, omega2: 0, k2: 0, fi: 0, Kfi: 0)
}
