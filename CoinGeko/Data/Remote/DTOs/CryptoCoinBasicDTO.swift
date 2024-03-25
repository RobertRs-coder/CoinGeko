//
//  CryptoCoinBasicDTO.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 23/3/24.
//

import Foundation

struct CryptoCoinBasicDTO: Codable{
    let id: String
    let symbol: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
    }
}
