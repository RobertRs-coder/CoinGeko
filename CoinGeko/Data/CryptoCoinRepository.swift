//
//  Repository.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 23/3/24.
//

import Foundation

class CryptoCoinErrorToDomainError {
    func map(error: HTTPClientError?) -> CryptoCoinDomainError {
        return .generic
    }
}

class CryptoCoinRepository: GlobalCryptoListRepositoryType {
    
    private let remoteDataSource: RemoteDataSourceType
    private let errorToDomainMapper: CryptoCoinErrorToDomainError
    
    init(remoteDataSource: RemoteDataSourceType, errorToDomainMapper: CryptoCoinErrorToDomainError) {
        self.remoteDataSource = remoteDataSource
        self.errorToDomainMapper = errorToDomainMapper
    }
    
    func getGlobalCryptoList() async -> Result <[CryptoCoin], CryptoCoinDomainError> {
        
        let symbolListResult = await remoteDataSource.getGlobalCryptoSymbolList()
        
        switch symbolListResult {
        case .failure(let error):
            return .failure(errorToDomainMapper.map(error: error))
        case .success(let symbolList):
            return .success(symbolList)
        }
        
//        guard case .success(let symbolList) = symbolListResult else {
//            guard case .failure(let error) = symbolListResult else {
//                return .failure(.generic)
//            }
//            return .failure(errorToDomainMapper.map(error: error))
//        }
        
        let cryptoListResult = await remoteDataSource.getCryptoList()

        guard case .success(let cryptoList) = cryptoListResult else {
            guard case .failure(let error) = cryptoListResult else {
                return .failure(.generic)
            }
            return .failure(errorToDomainMapper.map(error: error))
        }

        let priceInfoResult = await remoteDataSource.getPriceInfoForCryptos(for: <#T##[String]#>)
        
        guard case .success(let priceInfo) = priceInfoResult else {
            guard case .failure(let error) = priceInfoResult else {
                return .failure(.generic)
            }
            return .failure(errorToDomainMapper.map(error: error))
        }
        
        priceInfo
        
    }
}
