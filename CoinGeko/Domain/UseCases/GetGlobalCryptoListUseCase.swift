//
//  GetGlobalCryptoListUseCase.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 21/3/24.
//

import Foundation

class GetGlobalCryptoListUseCase {
    private let repository: GlobalCryptoListRepositoryType
    
    init(repository: GlobalCryptoListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[CryptoCoin], CryptoCoinDomainError> {
        let result = await repository.getGlobalCryptoList()
        
        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        
        return .success(cryptoList.sorted { $0.marketCap > $1.marketCap })
    }
}
