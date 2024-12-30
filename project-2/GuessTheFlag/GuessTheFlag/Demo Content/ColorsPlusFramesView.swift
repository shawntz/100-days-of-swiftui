//
//  ColorsPlusFramesView.swift
//  GuessTheFlag
//
//  Created by Shawn Schwartz on 12/29/24.
//

import SwiftUI

struct ColorsPlusFramesView: View {
    var body: some View {
        // apple calls this visual effect: vibrancy
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }

            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
//        ZStack {
//            Color.red
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//            Text("Your content")
//        }
    }
}

#Preview {
    ColorsPlusFramesView()
}
