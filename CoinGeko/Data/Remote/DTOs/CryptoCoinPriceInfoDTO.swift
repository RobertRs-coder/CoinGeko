//
//  CryptoCoinPriceInfoDTO.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 23/3/24.
//

import Foundation

struct CryptoCoinPriceInfoDTO: Codable{
    let price: Double
    let marketCap: Double
    let volume24h: Double
    let price24h: Double

    enum CodingKeys: String, CodingKey {
        case price = "usd"
        case marketCap = "usd_market_cap"
        case volume24h = "usd_24_vol"
        case price24h = "usd_24h_change"
    }
}
