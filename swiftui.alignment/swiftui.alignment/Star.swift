//
//  Rating.swift
//  Delete
//
//  Created by Igor Ivanov on 06.10.2020.
//

import SwiftUI

//#1:
//struct Star: View {
//    var body: some View {
//        VStack() {
//            Text("⭑⭑⭑⭑⭑")
//            Text("5 stars")
//        }.font(.caption)
//        .background(Color.yellow)
//    }
//}

//#2
//struct Star: View {
//    var body: some View {
//        VStack() {
//            Text("⭑⭑⭑⭑⭑")
//                .alignmentGuide(.midStarAndTitle, computeValue: { dimension in
//                    return dimension[.bottom]
//                }) // смесить (offset) звезды по нижнему краю
//            Text("5 stars")
//        }.font(.caption)
//        .background(Color.yellow)
//    }
//}

//#3
struct Star: View {
    var body: some View {
        VStack() {
            Text("⭑⭑⭑⭑⭑")
                .alignmentGuide(.mid, computeValue: { dimension in
                    return dimension[.bottom] / 2
                })
            Text("5 stars")
        }.font(.caption)
        .background(Color.yellow)
    }
}
