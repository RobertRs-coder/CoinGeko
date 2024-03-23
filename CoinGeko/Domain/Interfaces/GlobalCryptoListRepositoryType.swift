//
//  GlobalCryptoListRepositoryType.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 21/3/24.
//

import Foundation

protocol GlobalCryptoListRepositoryType {
    func getGlobalCryptoList() async -> Result<[CryptoCoin], CryptoCoinDomainError>
}
