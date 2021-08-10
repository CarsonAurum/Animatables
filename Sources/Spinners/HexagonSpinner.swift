//
//  HexagonSpinner.swift
//  /Spinners/
//
//  Created by Carson Rau on 8/6/21.
//

import SwiftUI

public struct Hexagon: Shape {
    public func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.width / 2, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height / 3))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height / 3 * 2))
            path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height / 3 * 2))
            path.addLine(to: CGPoint(x: 0, y: rect.height / 3))
            path.addLine(to: CGPoint(x: rect.width / 2, y: 0))
        }
    }
}

public struct HexagonSpinner: View {
    @Binding var scaleCircle: Bool
    @Binding var rotateHexagon: Bool
    public var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(scaleCircle ? .blue : .green)
                .scaleEffect(scaleCircle ? 1 : 0)
                .animation(.easeInOut(duration: 1).repeatForever().delay(2))
                .onAppear {
                    scaleCircle.toggle()
                }
            Image("Hexagon", bundle: .module)
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(rotateHexagon ? 0 : -60), anchor: .center)
                .animation(.timingCurve(0.19, 1, 0.22, 1, duration: 2).repeatForever(autoreverses: false))
                .onAppear {
                    rotateHexagon.toggle()
                }

        }
    }
}

#if DEBUG
struct HexagonSpinnerContainer: View {

    @State private var scaling: Bool = false
    @State private var rotating: Bool = false
    
    var body: some View {
        HexagonSpinner(scaleCircle: $scaling, rotateHexagon: $rotating)
    }
}
struct HexagonSpinner_Previews: PreviewProvider {
    static var previews: some View {
        HexagonSpinnerContainer()
    }
}
#endif


