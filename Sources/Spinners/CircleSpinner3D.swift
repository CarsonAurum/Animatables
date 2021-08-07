//
//  3DSpinner.swift
//  /Spinners/
//
//  Carson Rau - 8/6/21
//

import SwiftUI

public struct CircleSpinner3D: View {
    @Binding public var spinOuter: Bool
    @Binding public var spinMiddle: Bool
    @Binding public var spinInner: Bool
    public var color: Color = .blue
    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
                .foregroundColor(color)
                .frame(width: 100, height: 100)
                .rotation3DEffect(
                    .degrees(spinOuter ? 180 : 1),
                    axis: (x: spinOuter ? 1 : 0, y: 0, z: 0)
                )
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear {
                    spinOuter.toggle()
                }
            Circle()
                .stroke(lineWidth: 5.0)
                .foregroundColor(color)
                .frame(width: 60, height: 60)
                .rotation3DEffect(
                    .degrees(spinMiddle ? 360 : 1),
                    axis: (x: 0, y: spinMiddle ? 1 : 0, z: 0)
                )
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear {
                    spinMiddle.toggle()
                }
            Circle()
                .stroke(lineWidth: 5.0)
                .foregroundColor(color)
                .frame(width: 20, height: 20)
                .rotation3DEffect(
                    .degrees(spinInner ? 360 : 0),
                    axis: (x: spinInner ? 1 : 0, y: spinInner ? 1 : 0 , z: 0)
                )
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear {
                    spinInner.toggle()
                }
        }
    }
}

#if DEBUG
struct SpinnerContainer: View {
    @State private var spinX: Bool = false
    @State private var spinY: Bool = false
    @State private var spinXY: Bool = false

    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.white, .blue]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .edgesIgnoringSafeArea(.all)
            CircleSpinner3D(
                spinOuter: $spinX,
                spinMiddle: $spinY,
                spinInner: $spinXY
            )
        }
    }
}

struct CircleSpinner3D_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerContainer()
    }
}
#endif
