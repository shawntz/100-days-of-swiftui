//
//  AlertsView.swift
//  GuessTheFlag
//
//  Created by Shawn Schwartz on 12/29/24.
//

import SwiftUI

struct AlertsView: View {
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Button("show alert!") {
                showingAlert.toggle()
            }
        }
        .padding()
        .alert("important message", isPresented: $showingAlert) {
            Button("OK") { }  // intentional 2-way binding
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("please read this.")
        }

    }
}

#Preview {
    AlertsView()
}
