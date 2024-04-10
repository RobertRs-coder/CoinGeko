//
//  HTTPClientError.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 10/4/24.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case parsingError
    case badUrl
    case responseError
    case tooManyRequests
    case generic
}
