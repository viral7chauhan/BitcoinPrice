//
//  TitleView.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import SwiftUI

struct TitleView: View {
    @Binding var isLoading: Bool

    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "dollarsign.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .padding()
                .foregroundColor(.activeColor)
            Text("Hey there! The current price of bitcoin is \(isLoading ? "loading.." : "below") ")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(isLoading: .constant(true))
    }
}
