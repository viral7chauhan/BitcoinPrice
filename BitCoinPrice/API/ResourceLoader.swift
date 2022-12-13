//
//  PriceLoader.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import Foundation

final class ResourceLoader<T> {
    typealias Mapper = (Data, URLResponse) throws -> T

    private let url: URL
    private let client: HTTPClient
    private let mapper: Mapper

    init(url: URL, client: HTTPClient, mapper: @escaping Mapper) {
        self.url = url
        self.client = client
        self.mapper = mapper
    }

    func loadResource() async -> T? {
        do {
            let result = try await client.get(url)
            let (data, response) = try result.get()
            return try mapper(data, response)
        } catch {
            // handle extra network error and domain error here
            print(error.localizedDescription)
            return nil
        }
    }
}
