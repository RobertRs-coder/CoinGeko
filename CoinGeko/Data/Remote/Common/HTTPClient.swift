//
//  HTTPClient.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 10/4/24.
//

import Foundation

protocol HTTPClient {
    func makeRequest(endpoint: Endpoint, baseUrl: String) async -> Result<Data, HTTPClientError>
}
