//
//  RemoteDataSourceType.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 23/3/24.
//

import Foundation

protocol RemoteDataSourceType {
    // https://api.coingecko.com/api/v3/global
    func getGlobalCryptoSymbolList() async -> Result <[String], HTTPClientError>
    // https://api.coingecko.com/api/v3/coins/list
    func getCryptoList() async -> Result <[CryptoCoinBasicDTO], HTTPClientError>
    // https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cripple&vs_currencies=usd&include_market_cap=true&include_24hr_vol=true&include_24hr_change=true
    func getPriceInfoForCryptos(for id: [String]) async -> Result <[String: CryptoCoinPriceInfoDTO], HTTPClientError>
}
