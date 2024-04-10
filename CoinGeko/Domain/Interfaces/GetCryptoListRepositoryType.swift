//
//  GetCryptoListRepositoryType.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 8/4/24.
//

import Foundation

protocol GetCryptoListRepositoryType {
    func getCryptoList() async -> Result<[Crypto], CryptoDomainError>
}
