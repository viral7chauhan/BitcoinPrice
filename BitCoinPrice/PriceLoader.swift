//
//  PriceLoader.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import Foundation

final class PriceLoader {

    let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json")!
    let client: URLSession

    enum Error: Swift.Error {
        case invalidData
    }

    init(client: URLSession = .shared) {
        self.client = client
    }

    func loadPrice() async -> Response? {
        let requeset = URLRequest(url: url)
        do {
            let (data, response) = try await client.data(for: requeset)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.isOK else {
                throw Error.invalidData
            }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            let price = try jsonDecoder.decode(Response.self, from: data)
            print(price.bpi.usd.rateFloat)
            return price
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

private extension HTTPURLResponse {
    var isOK: Bool {
        statusCode == 200
    }
}
