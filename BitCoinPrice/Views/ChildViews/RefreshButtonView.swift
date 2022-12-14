//
//  RefreshButton.swift
//  BitCoinPrice
//
//  Created by Viral on 14/12/22.
//

import SwiftUI

struct RefreshButtonView: View {

    var isLoading: Bool
    var action: () -> Void

    var body: some View {
        Button {
            log("Refresh Clicked")
            action()
        } label: {
            Text("Refresh Price")
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .font(.system(size: 20))
        }
        .padding()
        .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
        .background(isLoading ? Color.disableColor : Color.activeColor)
        .clipShape(Capsule())
        .padding(.horizontal, 32)
        .shadow(radius: 2)
    }
}

struct RefreshButton_Previews: PreviewProvider {
    static var previews: some View {
        RefreshButtonView(isLoading: false, action: {})
    }
}
