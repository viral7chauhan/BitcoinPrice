//
//  BitCoinPriceApp.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import SwiftUI

@main
struct BitCoinPriceApp: App {
    var body: some Scene {
        WindowGroup {
            makeContentView()
        }
    }

    func makeContentView() -> PriceView {
        let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json")!
        
        let viewModel = PriceViewModel(
            loader: PriceFeedLoader(url: url, client: URLSessionClient(session: .shared))
        )

        return PriceView(viewModel: viewModel)
    }
}
