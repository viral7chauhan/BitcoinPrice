//
//  ContentView.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import SwiftUI

struct PriceView: View {
    @ObservedObject var viewModel: PriceViewModel

    var body: some View {
        ZStack {
            Color
                .backgroundColor.ignoresSafeArea()
            VStack(spacing: 100) {
                TitleView(isLoading: viewModel.isLoading)

                ReadingView(isLoading: viewModel.isLoading, price: viewModel.price)
                    .padding()

                RefreshButtonView(isLoading: viewModel.isLoading) {
                    Task {
                        await viewModel.loadPrice()
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadPrice()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BitCoinPriceApp.makeContentView()
    }
}
