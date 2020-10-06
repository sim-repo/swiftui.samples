//
//  Title.swift
//  Delete
//
//  Created by Igor Ivanov on 06.10.2020.
//

import SwiftUI


//#1:
//struct Title: View {
//    var body: some View {
//        HStack(alignment: .lastTextBaseline) {
//
//            Text("Avocado Toast").layoutPriority(1).background(Color.blue)
//
//
//            Text("Delicious").font(.caption).background(Color.blue)
//
//
//            Image("rect20x20")
//                .alignmentGuide(.lastTextBaseline, computeValue: { dimension in
//                    dimension[.bottom] * 0.7
//            })
//        }
//        .lineLimit(1)
//        .background(Color.yellow)
//    }
//}

//3:
struct Title: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            
            Text("Avocado Toast").layoutPriority(1).background(Color.blue)
                .alignmentGuide(.mid, computeValue: { dimension in
                    return dimension[.bottom]  / 2
                })

            Text("Delicious").font(.caption).background(Color.blue)
           
            
            Image("rect20x20")
                .alignmentGuide(.lastTextBaseline, computeValue: { dimension in
                    dimension[.top]
            })
        }
        .lineLimit(1)
        .background(Color.yellow)
    }
}
