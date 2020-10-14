//
//  Background.swift
//  swiftui.followEffect
//
//  Created by Igor Ivanov on 11.10.2020.
//

import SwiftUI


struct Background:UIViewRepresentable {
    var tappedCallback: ((CGPoint) -> Void)

    func makeUIView(context: UIViewRepresentableContext<Background>) -> UIView {
        let v = UIView(frame: .zero)
        let gesture = UITapGestureRecognizer(target: context.coordinator,
                                             action: #selector(Coordinator.tapped))
        v.addGestureRecognizer(gesture)
        return v
    }

    class Coordinator: NSObject {
        var tappedCallback: ((CGPoint) -> Void)
        init(tappedCallback: @escaping ((CGPoint) -> Void)) {
            self.tappedCallback = tappedCallback
        }
        @objc func tapped(gesture:UITapGestureRecognizer) {
            let point = gesture.location(in: gesture.view)
            self.tappedCallback(point)
        }
    }

    func makeCoordinator() -> Background.Coordinator {
        return Coordinator(tappedCallback:self.tappedCallback)
    }

    func updateUIView(_ uiView: UIView,
                       context: UIViewRepresentableContext<Background>) {
    }

}
