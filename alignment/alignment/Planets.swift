//
//  Planets.swift
//  alignment
//
//  Created by Igor Ivanov on 19.10.2020.
//

import SwiftUI

struct Planets: View {
    @State var position: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Hello()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.green).opacity(0.5))
                    .alignmentGuide(HorizontalAlignment.center, computeValue: { d in self.helloH(d) })
                    .alignmentGuide(VerticalAlignment.center, computeValue: { d in self.helloV(d) })
                
                World()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.yellow).opacity(0.5))
                    .alignmentGuide(HorizontalAlignment.center, computeValue: { d in self.worldH(d) })
                    .alignmentGuide(VerticalAlignment.center, computeValue: { d in self.worldV(d) })
                
            }

            Spacer()
            
            HStack {
                Button(action: { withAnimation(.easeInOut(duration: 1.0)) { self.position = 0 } }, label: {
                    Rectangle().frame(width: 50, height: 50).overlay(Text("H W").foregroundColor(.black))
                })

                Button(action: { withAnimation(.easeInOut(duration: 1.0)) { self.position = 1 } }, label: {
                    Rectangle().frame(width: 50, height: 50).overlay(Text("H\nW").foregroundColor(.black))
                })
                
                Button(action: { withAnimation(.easeInOut(duration: 1.0)) { self.position = 2 } }, label: {
                    Rectangle().frame(width: 50, height: 50).overlay(Text("W H").foregroundColor(.black))
                })

                Button(action: { withAnimation(.easeInOut(duration: 1.0)) { self.position = 3 } }, label: {
                    Rectangle().frame(width: 50, height: 50).overlay(Text("W\nH").foregroundColor(.black))
                })
            }
        }
    }
    
    func helloH(_ d: ViewDimensions) -> CGFloat {
        if position == 0 {
            return d[.trailing]
        } else if position == 1 {
            return 0
        } else if position == 2 {
            return d[.leading]
        } else {
            return 0
        }
    }

    func helloV(_ d: ViewDimensions) -> CGFloat {
        if position == 0 {
            return 0
        } else if position == 1 {
            return d[.bottom]
        } else if position == 2 {
            return 0
        } else {
            return d[.top]
        }
    }

    func worldH(_ d: ViewDimensions) -> CGFloat {
        if position == 0 {
            return d[.leading]
        } else if position == 1 {
            return 0
        } else if position == 2 {
            return d[.trailing]
        } else {
            return 0
        }
    }

    func worldV(_ d: ViewDimensions) -> CGFloat {
        if position == 0 {
            return 0
        } else if position == 1 {
            return d[.top]
        } else if position == 2 {
            return 0
        } else {
            return d[.bottom]
        }
    }
}

struct Hello: View {
    var body: some View {
        Group { Text("Hello").foregroundColor(.black) + Text(" World").foregroundColor(.clear) }.padding(20)
    }
}

struct World: View {
    var body: some View {
        Group { Text("Hello").foregroundColor(.clear) + Text(" World").foregroundColor(.black) }.padding(20)
    }
}
