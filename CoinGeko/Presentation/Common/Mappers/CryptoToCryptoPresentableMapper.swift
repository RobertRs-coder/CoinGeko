//
//  CryptoToCryptoPresentableMapper.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation

//MARK: - Domain Model to Presentable Model

protocol CryptoToCryptoPresentableMapperType {
    func map(_ cryptos: [Crypto]?) -> [CryptoPresentable]
    func map(_ crypto: Crypto?) -> CryptoPresentable?
}

class CryptoToCryptoPresentableMapper: CryptoToCryptoPresentableMapperType {
    func map(_ cryptos: [Crypto]?) -> [CryptoPresentable]{
        guard let cryptos = cryptos else { return [] }
        return cryptos.compactMap { map($0)
        }
    }
    
    func map(_ crypto: Crypto?) -> CryptoPresentable? {
        guard let crypto = crypto else { return nil }
        return CryptoPresentable(
            id: crypto.id,
            name: crypto.name,
            image: crypto.image,
            price: "\(crypto.price)",
            price24h: "\(crypto.price24h ?? 0)",
            volume24: "\(crypto.volume24 ?? 0)",
            marketCap: "\(crypto.marketCap ?? 0)"
        )
    }
}
