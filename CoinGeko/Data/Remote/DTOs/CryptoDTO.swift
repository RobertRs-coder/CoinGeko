//
//  CryptoDTO.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation


// MARK: - WelcomeElement
struct CryptoDTO: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let priceChange24H: Double
    let marketCap: Int
    let marketCapChange24H: Double


    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case priceChange24H = "price_change_24h"
        case marketCap = "market_cap"
        case marketCapChange24H = "market_cap_change_24h"
    }
}
