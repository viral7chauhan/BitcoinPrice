//
//  ContentView.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(spacing: 100) {
                TitleView()

                ReadingView()

                Button("Refresh Price") {
                    print("action")
                }
                .buttonStyle(CapsuleButton())
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CapsuleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.system(size: 20))
            .padding()
            .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
            .background(Color.activeColor)
            .clipShape(Capsule())
            .padding(.horizontal, 30)
            .shadow(radius: 2)
    }
}
