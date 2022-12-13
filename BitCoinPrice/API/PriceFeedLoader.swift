//
//  PriceLoader.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import Foundation

final class PriceFeedLoader {
    let url: URL
    let client: HTTPClient

    enum Error: Swift.Error {
        case invalidData
    }

    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    func loadPrice() async -> Response? {
        do {
            let result = try await client.get(url)
            let (data, response) = try result.get()
            return try PriceMapper.map(data, from: response)
        } catch {
            // handle extra network error and domain error here
            print(error.localizedDescription)
            return nil
        }
    }
}
