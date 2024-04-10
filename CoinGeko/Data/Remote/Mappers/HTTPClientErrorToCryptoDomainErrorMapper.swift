//
//  HTTPClientErrorToCryptoDomainErrorMapper.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 10/4/24.
//

import Foundation


class HTTPClientErrorToCryptoDomainErrorMapper {
    func map(_ error: HTTPClientError?) -> CryptoDomainError{
//        guard let error = error else { return nil }
        return .generic
    }
}
