//
//  VerticalAlignment+Extensions.swift
//  Delete
//
//  Created by Igor Ivanov on 06.10.2020.
//

import SwiftUI

extension VerticalAlignment {
    
    private enum Mid: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.top]
        }
    }

    static let mid = VerticalAlignment(Mid.self)
}
