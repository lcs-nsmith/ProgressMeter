//
//  ContentView.swift
//  ProgressMeter
//
//  Created by Nate S on 2021-12-15.
//

import SwiftUI

struct ContentView: View {
    // For driving animation to reveal rectangelwith progress meter fill
    @State private var progressMeterOffset =  CGSize.zero
    var body: some View {
        VStack {
            ZStack {
                // MARK: What does "MARK:" do?
                // MARK: What is the three forward slashes for?
                /// "Fill" for progress meter; stationary
                // Sits above the rectangle that slides up (in the z-axis)
                // This means the rectangle sliding up will pass beneath this view
                Rectangle()
                    .fill(Color(hue: 0, saturation: 0, brightness: 0, opacity: 0))
                // MARK: I don't understand how the mathematical operators here work or why they would be used?
                    .frame(width: 100 + 2, height: 548 - 44 + 2, alignment: .center)
                    .overlay(
                        Rectangle()
                            // MARK: What does .stroke do?
                            .stroke(Color.primary, lineWidth: 2)
                    )
                // Will Slide up
                Rectangle()
                    .fill(Color.primary)
                    .colorInvert()
                    .frame(width: 100, height: 548 - 44, alignment: .center)
                    .offset(progressMeterOffset)
                    .onAppear(perform: {
                        // Offset is moves the opaque rectangle up
                        withAnimation(Animation.easeIn(duration: 4.0)) {
                            progressMeterOffset = CGSize(width: 0, height: -1 * (548 - 44))
                        }
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
