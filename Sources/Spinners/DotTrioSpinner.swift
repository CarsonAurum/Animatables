//
//  File.swift
//  File
//
//  Created by Carson Rau on 8/7/21.
//

import SwiftUI

public struct DotTrioSpinner: View {
    @Binding var animating: Bool
    let duration: Double = 1
    let frame: CGSize = CGSize(width: 80, height: 80)
    public var body: some View {
        ZStack {
            Circle()
                .fill(Color(red: 96/255, green: 174/255, blue: 201/255))
                .frame(height: frame.height / 3)
                .offset(x: 0, y: animating ? -frame.height / 3 : 0)
            Circle()
                .fill(Color(red: 244/255, green: 132/255, blue: 177/255))
                .frame(height: frame.height / 3)
                .offset(x: animating ? -frame.height / 3 : 0, y: animating ? frame.height / 3 : 0)
            Circle()
                .fill(Color(red: 137/255, green: 192/255, blue: 188/255))
                .frame(height: frame.height / 3)
                .offset(x: animating ? frame.height / 3 : 0, y: animating ? frame.height / 3 : 0)
        }
        .animation(.easeInOut(duration: duration).repeatForever(autoreverses: true))
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .rotationEffect(.degrees(animating ? 360 : 0))
        .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false))
        .onAppear {
            animating.toggle()
        }
    }
}

#if DEBUG
struct DotTrioSpinnerContainer: View {

    @State private var animating: Bool = false

    var body: some View {
        DotTrioSpinner(animating: $animating)
    }
}
struct DotTrioSpinner_Previews: PreviewProvider {
    static var previews: some View {
        DotTrioSpinnerContainer()
    }
}
#endif
