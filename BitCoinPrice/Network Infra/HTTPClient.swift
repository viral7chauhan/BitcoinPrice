//
//  HTTPClient.swift
//  BitCoinPrice
//
//  Created by Viral on 14/12/22.
//

import Foundation

protocol HTTPClient {
    typealias Result = Swift.Result<(Data, URLResponse), Error>

    func get(_ url: URL) async throws -> Result
}
