//
//  AtomSpinner.swift
//  /Spinners/
//
//  Created by Carson Rau on 8/7/21.
//

import SwiftUI

public struct AtomSpinner: View {
    public enum AnimationType {
        case spring
        case ease
        internal var animation: Animation {
            switch self {
            case .spring:
                return Animation.interpolatingSpring(stiffness: 60, damping: 13).repeatForever(autoreverses: true)
            case .ease:
                return Animation.easeInOut(duration: 1.5).delay(0.5).repeatForever(autoreverses: true)
            }
        }
    }

    @Binding var scaleRotate: Bool
    @State var animationType: AnimationType
    public var automatic: Bool = true
    public var body: some View {
        ZStack {
            Image("Atom", bundle: .module)
                .scaleEffect(scaleRotate ? 1 : 0.4)
                .rotationEffect(.degrees(scaleRotate ? 360 : 0), anchor: .center)
                .animation(animationType.animation)
                .onAppear {
                    if automatic {
                        scaleRotate.toggle()
                    }
                }
        }
    }
}

#if DEBUG
struct AtomSpinnerContainer: View {
    @State private var animating: Bool = false

    var body: some View {
        ZStack {
            Color(red: 0.0, green: 0.0, blue: 0.0)
                .scaleEffect(1.2)
            AtomSpinner(scaleRotate: $animating, animationType: .ease)
                .scaleEffect(2)
        }
    }
}

struct AtomSpinner_Previews: PreviewProvider {
    static var previews: some View {
        AtomSpinnerContainer()
    }
}
#endif
