//
//  ContentView.swift
//  project-3
//
//  Created by Shawn Schwartz on 12/30/24.
//
// Task: Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font suitable for prominent titles in a view.

import SwiftUI

struct LargeBlueModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(LargeBlueModifier())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .titleStyle()
    }
}

#Preview {
    ContentView()
}
