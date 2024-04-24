//
//  URLSessionHTTPClient.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 10/4/24.
//

import Foundation

class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    private let requestMaker: URLSessionRequestMaker
    private let errorResolver: URLSessionErrorResolver
    
    init(session: URLSession = .shared, requestMaker: URLSessionRequestMaker,  errorResolver: URLSessionErrorResolver) {
        self.session = session
        self.requestMaker = requestMaker
        self.errorResolver  = errorResolver
    }
    
    func makeRequest(endpoint: Endpoint, baseUrl: String) async -> Result<Data, HTTPClientError> {
          
        guard let urlRequest = requestMaker.url(endpoint: endpoint, baseUrl: baseUrl) else {
            return .failure(.badUrl)
        }
        
        do {
            let (data, response) = try await session.data(for: urlRequest)

            guard let response = response as? HTTPURLResponse else {
                return .failure(.responseError)
            }
            
            guard response.statusCode == 200 else {
                return .failure(errorResolver.resolve(statusCode: response.statusCode))
            }
            
            return .success(data)
            
        } catch {
            return .failure(errorResolver.resolve(error: error))
        }
    }
}
