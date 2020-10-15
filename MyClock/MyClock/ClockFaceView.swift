//
//  DigitView.swift
//  MyClock
//
//  Created by Igor Ivanov on 14.10.2020.
//

import SwiftUI

struct ClockFace: View {
    
    enum DigitType {
        case hours, minutes, seconds
    }
    
    var digitType: DigitType
    let radius: Double
    let center: CGPoint
    let bkgColor: Color
    let foregroundColor: Color
    let digitSize: CGFloat
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(bkgColor)
                .frame(width: CGFloat(2*radius+20), height: CGFloat(2*radius+20))
                .position(center)
            
            ForEach(1..<getMaxDigit()+1) { dig in
                Text(getDigitSymbol(dig))
                    .font(.system(size: digitSize))
                    .foregroundColor(foregroundColor)
                    .position(getPosition(digit: dig))
            }
        }
    }
    
    
    private func getDigitSymbol(_ digit: Int) -> String {
        var symbol = "∙"
        var divider: Int = 1
        if digitType == .minutes ||
            digitType == .seconds {
            divider = 5
        }
        
        if digit % divider == 0 {
            symbol = "\(digit)"
        }
        return symbol
    }
    
    
    private func getMaxDigit() -> Int {
        switch digitType {
        case .hours:
            return 12
        case .minutes, .seconds:
            return 60
        }
    }
    
    
    private func getPosition(digit: Int) -> CGPoint {
        let hHypotenuse = Double(2*radius) * 0.5
        let hAngle: Angle = .degrees(Double(digit)/Double(getMaxDigit()) * 360 - 90)
        
        return CGPoint(x: center.x + CGFloat(cos(hAngle.radians)*hHypotenuse),
                       y: center.y + CGFloat(sin(hAngle.radians)*hHypotenuse))
    }
}

struct ClockFace_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            ClockFace(digitType: .minutes, radius: 300, center: CGPoint(x: proxy.size.width/2, y: proxy.size.height/2), bkgColor: .blue, foregroundColor: .white, digitSize: 10)
            
            ClockFace(digitType: .hours, radius: 200, center: CGPoint(x: proxy.size.width/2, y: proxy.size.height/2), bkgColor: .green, foregroundColor: .white, digitSize: 10)
            
        }
        
    }
}
