//
//  ButtonsPlusImagesView.swift
//  GuessTheFlag
//
//  Created by Shawn Schwartz on 12/29/24.
//

import SwiftUI

struct ButtonsPlusImagesView: View {
    var body: some View {
        // trailing closure method
        //        Button("Delete selection") {
        //            print("now deleting...")
        //        }

        // same thing:
        //        Button("delete selection", role: .destructive, action: executeDelete)
        // role is helpful for voiceover accessibility

        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)

            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)

            Button("Button 3") { }
                .buttonStyle(.borderedProminent)

            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
        }

        VStack {
            // use multiple trailing closures to create a fully custom button style
            Button {
                print("button was tapped")
            } label: {
                Text("tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }

        // rendering pictures in your apps (3 methods)
        VStack {
            //            Image("test")  // works great for pictures custom to your project
            //            Image(decorative: "test")  // voiceover will skip this and treat it like a background image (but it will visually look the same)
            Image(systemName: "pencil.circle")  // SF symbols method
                .foregroundStyle(.red)
                .font(.largeTitle)  // have sensible names to your images since screenreader will read the filename of the image (or use decorative)
        }

        VStack {
            // using both text and picture at the same time
            //            Button("Edit", systemImage: "pencil") {
            //                print("button was tapped!!")
            //            } label: {
            //                // and use an hstack here:
            ////                HStack { }
            //            }

            // or, use the more preferred Label() method, which is smarter than the HStack method (i.e., it will automatically decide when your code runs if it should show just the icon, just the text, or both together -- hence, it adapts automatically)
            // note: you can't then pass the label options directly into the Button View struct like above because then swift will throw a duplicate trailing closures error
            Button {
                print("button was tapped!!")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
    }

    func executeDelete() {
        print("now deleting...")
    }
}

#Preview {
    ButtonsPlusImagesView()
}
