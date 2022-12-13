//
//  ContentView.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PriceViewModel(loader: PriceLoader())

    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(spacing: 100) {
                TitleView(isLoading: $viewModel.isLoading)

                ReadingView(isLoading: $viewModel.isLoading, price: $viewModel.price)

                Button("Refresh Price") {
                    print("Button action tapped")
                    Task {
                        await viewModel.loadPrice()
                    }
                }
                .foregroundColor(.white)
                .font(.system(size: 20))
                .padding()
                .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
                .background(viewModel.isLoading ? Color.disableColor : Color.activeColor)
                .clipShape(Capsule())
                .padding(.horizontal, 30)
                .shadow(radius: 2)
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
