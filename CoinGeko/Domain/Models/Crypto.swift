//
//  Crypto.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation

struct Crypto: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let price: Double
    let price24h: Double?
    let marketCap: Int
    let marketCap24: Double?
    
}
