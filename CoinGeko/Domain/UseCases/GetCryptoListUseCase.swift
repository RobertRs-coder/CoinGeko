//
//  GetCryptoListUseCase.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 8/4/24.
//

import Foundation

protocol GetCryptoListUseCaseType {
    func execute() async -> Result<[Crypto], CryptoDomainError>
}

class GetCryptoListUseCase: GetCryptoListUseCaseType {

    private let repository: CryptoRepositoryType
    
    init(repository: CryptoRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Crypto], CryptoDomainError> {
        let result = await repository.getCryptoList()
        
        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        return .success(cryptoList.sorted { $0.marketCap > $01.marketCap})
    }
}
