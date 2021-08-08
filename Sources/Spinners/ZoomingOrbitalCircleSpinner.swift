//
//  OrbitalCircleSpinner.swift
//  /Spinners/
//
//  Created by Carson Rau on 8/7/21.
//

import SwiftUI

public struct ZoomingOrbitalCircleSpinner: View {
    @Binding public var animate: Bool
    public var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(red: 0, green: 0.5, blue: 1))
                .scaleEffect(animate ? 1 : 0.5)
                .animation(.interpolatingSpring(stiffness: 170, damping: 20).speed(1.5).repeatForever(autoreverses: true))
            ZStack {
                Circle()
                    .trim(from: 3/4, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 1))
                Circle()
                    .trim(from: 3/4, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 1))
                    .rotationEffect(.degrees(-180))
            }
            .scaleEffect(animate ? 1 : 0.4)
            .rotationEffect(.degrees(animate ? 360 : 0))
            .animation(.interpolatingSpring(stiffness: 170, damping: 20).speed(1.5).repeatForever(autoreverses: true))
        }
        .onAppear {
            animate.toggle()
        }
    }
}

#if DEBUG
struct ZoomingOrbitalCircleSpinnerContainer: View {

    @State private var animating: Bool = false

    var body: some View {
        ZoomingOrbitalCircleSpinner(animate: $animating)
            .scaleEffect(2)
    }
}
struct ZoomingOrbitalCircleSpinner_Previews: PreviewProvider { 
    static var previews: some View {
        ZoomingOrbitalCircleSpinnerContainer()
    }
}
#endif
