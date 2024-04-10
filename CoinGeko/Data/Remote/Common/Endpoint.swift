//
//  Endpoint.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 10/4/24.
//

import Foundation

struct Endpoint {
    let path: String
    let queryParams : [String: Any]
    let method: HTTPMethod
}
