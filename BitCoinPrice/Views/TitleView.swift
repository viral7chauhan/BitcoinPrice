//
//  TitleView.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "heart")
                .resizable()
                .frame(width: 60, height: 60)
                .padding()
            Text("Hey there! The current price of bitcoin is below")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
