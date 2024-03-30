//
//  Crypto.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation

struct Crypto: Identifiable {
    let id: String
    let name: String
    let image: String
    let price: Double
    let price24h: Double?
    let volume24: Double?
    let marketCap: Double?
    
}
