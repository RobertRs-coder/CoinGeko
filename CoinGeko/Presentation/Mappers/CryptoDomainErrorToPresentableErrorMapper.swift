//
//  CryptoDomainErrorToPresentableErrorMapper.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 18/4/24.
//

import Foundation

class CryptoDomainErrorToPresentableErrorMapper {
    func map(error: CryptoDomainError?) -> String {
        guard error == .tooManyRequests else {
            return "Something went wrong"
        }
        return "You have exceeded the limit. Try again later"
    }
}
