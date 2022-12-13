//
//  URLSessionClient.swift
//  BitCoinPrice
//
//  Created by Viral on 14/12/22.
//

import Foundation

final class URLSessionClient: HTTPClient {
    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func get(_ url: URL) async throws -> HTTPClient.Result {
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            return .success((data, response))
        } catch {
            return .failure(error)
        }
    }
}
