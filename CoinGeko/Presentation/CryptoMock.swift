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

let json =
"""
[{
  "id": "bitcoin",
  "name": "Bitcoin",
  "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
  "price": 69990,
  "price24h": -779.6933773967612,
  "volume24": 23927684679,
  "marketCap": 1376729476810
}
"""
//{
//  "id": "ethereum",
//  "symbol": "eth",
//  "name": "Ethereum",
//  "image": "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
//  "current_price": 3511.16,
//  "market_cap": 421601455040,
//  "market_cap_rank": 2,
//  "fully_diluted_valuation": 421602152646,
//  "total_volume": 13361451876,
//  "high_24h": 3576.92,
//  "low_24h": 3480.27,
//  "price_change_24h": -48.663668166850584,
//  "price_change_percentage_24h": -1.36703,
//  "market_cap_change_24h": -6587521674.914856,
//  "market_cap_change_percentage_24h": -1.53846,
//  "circulating_supply": 120070534.904237,
//  "total_supply": 120070534.904237,
//  "max_supply": null,
//  "ath": 4878.26,
//  "ath_change_percentage": -27.95875,
//  "ath_date": "2021-11-10T14:24:19.604Z",
//  "atl": 0.432979,
//  "atl_change_percentage": 811570.02899,
//  "atl_date": "2015-10-20T00:00:00.000Z",
//  "roi": {
//    "times": 66.06938901548313,
//    "currency": "btc",
//    "percentage": 6606.938901548313
//  },
//  "last_updated": "2024-03-30T02:15:41.052Z"
//},
//{
//  "id": "tether",
//  "symbol": "usdt",
//  "name": "Tether",
//  "image": "https://assets.coingecko.com/coins/images/325/large/Tether.png?1696501661",
//  "current_price": 1.001,
//  "market_cap": 104558532875,
//  "market_cap_rank": 3,
//  "fully_diluted_valuation": 104558532875,
//  "total_volume": 52788218964,
//  "high_24h": 1.002,
//  "low_24h": 0.996853,
//  "price_change_24h": 0.00059039,
//  "price_change_percentage_24h": 0.05903,
//  "market_cap_change_24h": 67110669,
//  "market_cap_change_percentage_24h": 0.06423,
//  "circulating_supply": 104505348425.461,
//  "total_supply": 104505348425.461,
//  "max_supply": null,
//  "ath": 1.32,
//  "ath_change_percentage": -24.40681,
//  "ath_date": "2018-07-24T00:00:00.000Z",
//  "atl": 0.572521,
//  "atl_change_percentage": 74.69577,
//  "atl_date": "2015-03-02T00:00:00.000Z",
//  "roi": null,
//  "last_updated": "2024-03-30T02:11:30.134Z"
//}
//"""
    .data(using: .utf8)!


let cryptoList = try? JSONDecoder().decode([Crypto].self, from: json)

let mockCryptoList = CryptoToCryptoPresentableMapper().map(cryptoList ?? [])

//print(mockCryptoList)



