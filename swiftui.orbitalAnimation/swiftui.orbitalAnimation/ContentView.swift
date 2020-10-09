//
//  ContentView.swift
//  swiftui.orbitalAnimation
//
//  Created by Igor Ivanov on 08.10.2020.
//

import SwiftUI

struct ContentView: View {
    
      
    var body: some View {
        //PolygonView()
        //PolygonView2()
        //Example3()
        //Example4()
        //FlowerView()

        let plot = flowerPlot(i: 4)
        let view = DataPlotView(R1: plot.R1, omega1: plot.omega1, k1: plot.k1, R2: plot.R2, omega2: plot.omega2, k2: plot.k2, fi: plot.fi, Kfi: plot.Kfi)

        return view.ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
