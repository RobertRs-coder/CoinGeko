//
//  RemoteDataSourceType.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 10/4/24.
//

import Foundation

protocol RemoteCryptoDataSourceType {
    func getCryptoList() async -> Result<[CryptoDTO], HTTPClientError>
}
