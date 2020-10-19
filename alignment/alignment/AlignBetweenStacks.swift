//
//  AlignBetweenStacks.swift
//  alignment
//
//  Created by Igor Ivanov on 19.10.2020.
//

import SwiftUI


extension VerticalAlignment {
    
    private enum MyStackAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    
    static let myStackAlignment = VerticalAlignment(MyStackAlignment.self)
}


struct StackAlignment: View {
    
    @State private var selectedIndex = 1
    @State private var selectedIndex2 = 1
    
    let colors: [Color] = [.gray, .gray, .gray]
    
    var body: some View {
        
        HStack(alignment: .myStackAlignment) {
            VStack {
                ForEach(colors.indices, id: \.self) { idx in
                    if idx == selectedIndex {
                        Rectangle()
                            .foregroundColor(.blue)
                            .transition(AnyTransition.identity)
                            .alignmentGuide(.myStackAlignment, computeValue: {d in
                                d[.center]
                            })
                    
                    } else {
                        Rectangle()
                            .foregroundColor(colors[idx])
                            .transition(AnyTransition.identity)
                            .onTapGesture {
                                withAnimation(Animation.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.1)) {
                                    selectedIndex = idx
                                }
                            }
                    }
                }
            }
            
            VStack {
                ForEach(colors.indices, id: \.self) { idx in
                    if idx == selectedIndex2 {
                        Rectangle()
                            .foregroundColor(.blue)
                            .transition(AnyTransition.identity)
                            .alignmentGuide(.myStackAlignment, computeValue: {d in d[.center]})
                    } else {
                        Rectangle()
                            .foregroundColor(colors[idx])
                            .transition(AnyTransition.identity)
                            .onTapGesture {
                                withAnimation(Animation.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.1)) {
                                    selectedIndex2 = idx
                                }
                            }
                    }
                }
            }
        }
    }
}
