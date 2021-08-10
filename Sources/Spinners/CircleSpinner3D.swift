//
//  3DSpinner.swift
//  /Spinners/
//
//  Carson Rau - 8/6/21
//

import SwiftUI

public struct CircleSpinner3D: View {
    @Binding public var animating: Bool
    public var color: Color = .blue
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                Circle()
                    .stroke(lineWidth: proxy.size.width / 20)
                    .foregroundColor(color)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .rotation3DEffect(
                        .degrees(animating ? 180 : 1),
                        axis: (x: animating ? 1 : 0, y: 0, z: 0)
                    )
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true))
                Circle()
                    .stroke(lineWidth: proxy.size.width / 20)
                    .foregroundColor(color)
                    .frame(width: proxy.size.width * 0.6, height: proxy.size.height * 0.6)
                    .rotation3DEffect(
                        .degrees(animating ? 360 : 1),
                        axis: (x: 0, y: animating ? 1 : 0, z: 0)
                    )
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true))
                Circle()
                    .stroke(lineWidth: proxy.size.width / 20)
                    .foregroundColor(color)
                    .frame(width: proxy.size.width * 0.2, height: proxy.size.height * 0.2)
                    .rotation3DEffect(
                        .degrees(animating ? 540 : 0),
                        axis: (x: animating ? 1 : 0, y: animating ? 1 : 0 , z: 0)
                    )
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true))
            }
            .onAppear {
                animating.toggle()
            }
        }
    }
}

#if DEBUG
struct SpinnerContainer: View {
    @State private var animate: Bool = false
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.white, .blue]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .edgesIgnoringSafeArea(.all)
            CircleSpinner3D(animating: $animate)
                .frame(width: 100, height: 100, alignment: .center)
        }
    }
}

struct CircleSpinner3D_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerContainer()
    }
}
#endif
