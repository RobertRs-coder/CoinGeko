//
//  CryptoListFactory.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 10/4/24.
//

import Foundation


class CryptoListFactory {
    
    static func create() -> CryptoListView {
        CryptoListView(viewModel: createViewModel())
        
    }
    
    private static func createViewModel() -> CryptoListViewModel {
        return CryptoListViewModel(
            getCryptoListUseCase: createUseCase(),
            presentableDataMapper: CryptoToCryptoPresentableMapper()
        )
    }
    
    private static func createUseCase() -> GetCryptoListUseCaseType {
        return GetCryptoListUseCase(repository: createRepository())
    }
    
    private static func createRepository() -> CryptoRepositoryType {
        return CryptoRepository(
            remoteDataSource: createDataSource(),
            dataMapper: CryptoDTOToCryptoMapper(),
            errorMapper: HTTPClientErrorToCryptoDomainErrorMapper()
        )
    }
    
    private static func createDataSource() -> RemoteDataSourceType {
        let httpClient = URLSessionHTTPClient(
            requestMaker: URLSessionRequestMaker(),
            errorResolver: URLSessionErrorResolver()
        )
        return RemoteDataSource(httpClient: httpClient)
    }
}
