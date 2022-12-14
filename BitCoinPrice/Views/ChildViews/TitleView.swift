//
//  TitleView.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import SwiftUI

struct TitleView: View {
    var isLoading: Bool

    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "dollarsign.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .padding()
                .foregroundColor(.activeColor)
            Text("Hey there! The current price of bitcoin is \(suffix)")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
        }
    }

    var suffix: String {
        isLoading ? "loading.." : "below"
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(isLoading: true)
    }
}
