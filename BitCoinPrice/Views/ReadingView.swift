//
//  ReadingView.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import SwiftUI

struct ReadingView: View {

    var isLoading: Bool
    var price: String

    var body: some View {
        VStack(spacing: 4) {
            Text("Price")
                .font(.title2)
            Text(isLoading ? "loading..." : "$\(price)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding()
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingView(isLoading: false, price: "464654")
    }
}
