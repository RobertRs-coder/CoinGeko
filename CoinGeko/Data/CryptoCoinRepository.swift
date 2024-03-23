//
//  Repository.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 23/3/24.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
}

protocol RemoteDataSourceType {
    // https://api.coingecko.com/api/v3/global
    func getGlobalCryptoSymbolList() async -> Result <[String], HTTPClientError>
    // https://api.coingecko.com/api/v3/coins/list
    func getCryptoList() async -> Result <[CryptoCoinBasicDTO], HTTPClientError>
    // https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cripple&vs_currencies=usd&include_market_cap=true&include_24hr_vol=true&include_24hr_change=true
    func getPriceInfoForCryptos(for id: [String]) async -> Result <[String: CryptoCoinPriceInfoDTO], HTTPClientError>
}

struct CryptoCoinBasicDTO: Codable{
    let id: String
    let symbol: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
    }
}

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

class CryptoCoinRepository: GlobalCryptoListRepositoryType {
    
    private let remoteDataSource: RemoteDataSourceType
    
    init(remoteDataSource: RemoteDataSourceType) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getGlobalCryptoList() async -> Result <[CryptoCoin], CryptoCoinDomainError> {
        
//        let symbolListResult = await remoteDataSource.getGlobalCryptoSymbolList()
        
        return []
    }
}
