//
//  ReadingView.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import SwiftUI

struct ReadingView: View {
    var body: some View {
        VStack(spacing: 4) {
            Text("Price")
                .font(.title2)
            Text("$16,394")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding()
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingView()
    }
}
