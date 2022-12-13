//
//  PriceViewModel.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import Foundation

final class PriceViewModel: ObservableObject {

    @Published var isLoading = false
    @Published var price: String = ""

    private var priceModel: Response?
    private let loader: PriceFeedLoader

    private var valueFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    init(loader: PriceFeedLoader) {
        self.loader = loader
    }

    @MainActor
    func loadPrice() async {
        isLoading = true
        try! await Task.sleep(until: .now + .seconds(3), clock: .continuous)
        priceModel = await loader.loadPrice()
        price = priceInString ?? ""
        isLoading = false
    }

    // MARK: - Helpers
    private var priceInString: String? {
        guard let value = priceModel?.bpi.usd.rateFloat else {
            return nil
        }

        let number = NSNumber(value: value)
        return valueFormatter.string(from: number)
    }
}
