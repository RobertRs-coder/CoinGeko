//
//  CryptoDTOToCryptoMapper.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation

class CryptoDTOToCryptoMapper {
    func map(_ cryptos: [CryptoDTO]?) -> [Crypto]{
        guard let cryptos = cryptos else { return [] }
        return cryptos.compactMap { map($0) }
    }
    
    func map(_ crypto: CryptoDTO?) -> Crypto? {
        guard let crypto = crypto else { return nil }
        return Crypto(
            id: crypto.id,
            name: crypto.name,
            image: crypto.image,
            price: crypto.currentPrice,
            price24h: crypto.priceChange24H,
            marketCap: crypto.marketCap,
            marketCap24: crypto.marketCapChange24H
        )
    }
}
