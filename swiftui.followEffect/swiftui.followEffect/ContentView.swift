//
//  ContentView.swift
//  swiftui.followEffect
//
//  Created by Igor Ivanov on 11.10.2020.
//

import SwiftUI


struct ContentView: View {

    @State private var isCheckpointAnimationFinished = false
    
    @EnvironmentObject var vm: AirplaneViewModel
    
    var body: some View {
        let bindingOfCheckpointPassed = Binding<Bool>(get: { true }, set: { updateCheckpoint($0) })
        
        GeometryReader { proxy in
            ZStack(alignment: .topLeading) {

                Text("")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.white)
                    .edgesIgnoringSafeArea(.all)
                    .gesture(
                        DragGesture(minimumDistance: 20)
                            .onChanged { gesture in
                                vm.didTouch(gesture: gesture)
                            }
                            .onEnded { val in
                                vm.didStopTouch()
                            }
                    )
                
                CustomShape(points: vm.points)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [7, 7], dashPhase: 0))


                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                    .offset(x: -25, y: -25)
                    .modifier(FollowEffect(fraction: self.isCheckpointAnimationFinished ? 1 : 0,
                                           path: CustomShape(points: vm.getSegmentPoints()).createPath(),
                                           didGetCheckpoint: bindingOfCheckpointPassed))


                ForEach(vm.points, id: \.debugDescription) { point in
                    Color.blue
                        .frame(width:5, height:5, alignment: .center)
                        .offset(CGSize(width: point.x, height: point.y))
                }
            }
        }
        .onAppear {
            fireNewCheckpointAnimation(duration: 0)
        }
    }

    func updateCheckpoint(_ isCheckpointPassed: Bool) {
        if isCheckpointPassed {
            let completion: (Double) -> Void = { fullTime in
                fireNewCheckpointAnimation(duration: fullTime)
            }
            vm.updateCheckpoint(completion: completion)
        }
    }

    func fireNewCheckpointAnimation(duration: Double) {
        isCheckpointAnimationFinished = false
        withAnimation(Animation.linear(duration: duration)) {
            isCheckpointAnimationFinished = true
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


