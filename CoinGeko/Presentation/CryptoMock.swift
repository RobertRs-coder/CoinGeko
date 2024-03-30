//
//  CryptoMock.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation

let cryptoListMock: [CryptoPresentable] = [
    CryptoPresentable(
        id: "bitcoin",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        price: "69890",
        price24h: "-1.55258",
        volume24: "25629998008",
        marketCap: "1374791722320"
    ),
    CryptoPresentable(
        id: "ripple",
        name: "Ripple",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        price: "69890",
        price24h: "10.55258",
        volume24: "25629998008",
        marketCap: "1374791722320"
    ),
    CryptoPresentable(
        id: "ethereum",
        name: "Ethereum",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        price: "100000",
        price24h: "11.55258",
        volume24: "25629998008",
        marketCap: "1374791722320"
    )
]
