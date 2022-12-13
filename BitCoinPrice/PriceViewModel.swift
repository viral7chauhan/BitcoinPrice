//
//  PriceViewModel.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import Foundation

final class PriceViewModel: ObservableObject {
    @Published var priceModel: Response?
    @Published var isLoading = false
    @Published var price: String = ""

    private let loader: PriceLoader

    private var valueFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    init(loader: PriceLoader) {
        self.loader = loader
    }

    @MainActor
    func loadPrice() async {
        isLoading = true
        priceModel = await loader.loadPrice()
        price = priceInString ?? ""
        isLoading = false
    }

    private var priceInString: String? {
        guard let value = priceModel?.bpi.usd.rateFloat else {
            return nil
        }

        let number = NSNumber(value: value)
        return valueFormatter.string(from: number)
    }
}
