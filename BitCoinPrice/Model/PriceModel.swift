//
//  PriceModel.swift
//  BitCoinPrice
//
//  Created by Viral on 13/12/22.
//

import Foundation


// MARK: - Response
struct Response: Codable {
    let time: Time
    let disclaimer, chartName: String
    let bpi: Bpi
}

// MARK: - Bpi
struct Bpi: Codable {
    let usd, gbp, eur: Currency

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case gbp = "GBP"
        case eur = "EUR"
    }
}

// MARK: - Eur
struct Currency: Codable {
    let code, symbol, rate, eurDescription: String
    let rateFloat: Double

    enum CodingKeys: String, CodingKey {
        case code, symbol, rate
        case eurDescription = "description"
        case rateFloat = "rate_float"
    }
}

// MARK: - Time
struct Time: Codable {
    let updated: String
    let updatedISO: Date
    let updateduk: String
}
