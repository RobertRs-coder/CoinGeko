//
//  RemoteDataSource.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 10/4/24.
//

import Foundation

class RemoteDataSource: RemoteDataSourceType {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getCryptoList() async -> Result<[CryptoDTO], HTTPClientError> {
        
        let queryParams: [String: Any] = [:]
        
        let endpoint = Endpoint(
            path: "coins/markets",
            queryParams: queryParams,
            method: .get
        )
        
        let result = httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://api.coingecko.com/api/v3/")
        
        switch result {
            case .success(let data):
                guard let cryptoList = try? JSONDecoder().decode([CryptoDTO].self, from: data) else {
                    return .failure(.parsingError)
                }
                return .success(cryptoList)
            case .failure(let error):
                return .failure(error)
        }

    }
}





