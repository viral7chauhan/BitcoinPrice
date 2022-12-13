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
            BitCoinPriceApp.makeContentView()
        }
    }

    // Compose view by its depedency
    static func makeContentView() -> PriceView {
        let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json")!


        let viewModel = PriceViewModel(
            loader: ResourceLoader<Response>(url: url, client: URLSessionClient(session: .shared),
                                              mapper: PriceMapper.map)
        )

        return PriceView(viewModel: viewModel)
    }
}
