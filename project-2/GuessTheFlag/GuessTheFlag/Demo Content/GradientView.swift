//
//  GradientView.swift
//  GuessTheFlag
//
//  Created by Shawn Schwartz on 12/29/24.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
//        LinearGradient(
//            colors: [.white, .black],
//            startPoint: .top,
//            endPoint: .bottom
//        )

//        LinearGradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55)
//        ], startPoint: .top, endPoint: .bottom)

//        RadialGradient(
//            colors: [.blue, .black],
//            center: .center,
//            startRadius: 20,
//            endRadius: 200
//        )

//        AngularGradient(
//            colors: [.red, .yellow, .green, .blue, .purple, .red],
//            center: .center
//        )

        // this gradient is much simpler and can only be used as background/foreground
        Text("your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.blue.gradient) // super gentle, subtle but helps elevate design
    }
}

#Preview {
    GradientView()
}
