//
//  CryptoRepository.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 8/4/24.
//

import Foundation





class CryptoRepository: GetCryptoListRepositoryType {

    private let remoteDataSource: RemoteDataSourceType
    private let dataMapper: CryptoDTOToCryptoMapper
    private let errorMapper: HTTPClientErrorToCryptoDomainErrorMapper
    
    init(remoteDataSource: RemoteDataSourceType, dataMapper: CryptoDTOToCryptoMapper, errorMapper: HTTPClientErrorToCryptoDomainErrorMapper) {
        self.remoteDataSource = remoteDataSource
        self.dataMapper = dataMapper
        self.errorMapper = errorMapper
    }
    
    func getCryptoList() async -> Result<[Crypto], CryptoDomainError> {
  
        let result = await remoteDataSource.getCryptoList()
        
        switch result {
            case .success(let cryptoList):
                return .success(dataMapper.map(cryptoList))
            case .failure(let error):
                return .failure(errorMapper.map(error))
        }
    }
}
