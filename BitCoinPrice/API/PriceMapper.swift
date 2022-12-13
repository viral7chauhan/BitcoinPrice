//
//  PriceMapper.swift
//  BitCoinPrice
//
//  Created by Viral on 14/12/22.
//

import Foundation

// Handle parsing and return model
enum PriceMapper {
    static func map(_ data: Data, from response: URLResponse) throws -> Response {
        guard response.isOK else {
            throw PriceFeedLoader.Error.invalidData
        }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        return try jsonDecoder.decode(Response.self, from: data)
    }
}

private extension URLResponse {
    var isOK: Bool {
        guard let httpResponse = self as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            return false
        }
        return true
    }
}
