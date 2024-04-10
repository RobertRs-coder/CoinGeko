//
//  URLSessionRequestMaker.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 10/4/24.
//

import Foundation

class URLSessionRequestMaker {
    func url(endpoint: Endpoint, baseUrl: String) -> URL? {
        var urlComponents = URLComponents(string: baseUrl + endpoint.path)
        let urlQueryParams = endpoint.queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        urlComponents?.queryItems = urlQueryParams
        
        return urlComponents?.url
        
    }
}
