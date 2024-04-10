//
//  GetCryptoListRepositoryType.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 8/4/24.
//

import Foundation

protocol CryptoRepositoryType {
    func getCryptoList() async -> Result<[Crypto], CryptoDomainError>
}
