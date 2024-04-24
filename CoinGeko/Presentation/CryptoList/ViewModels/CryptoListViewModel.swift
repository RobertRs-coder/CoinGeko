//
//  CryptoListViewModel.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation

final class CryptoListViewModel: ObservableObject {
    @Published var cryptos = [CryptoPresentable]()
    @Published var errorMessage: String?
    @Published var showLoading = false
    private let getCryptoListUseCase: GetCryptoListUseCaseType
    private let dataMapper: CryptoToCryptoPresentableMapper
    private let errorMapper: CryptoDomainErrorToPresentableErrorMapper
    
    init(getCryptoListUseCase: GetCryptoListUseCaseType, dataMapper: CryptoToCryptoPresentableMapper,  errorMapper: CryptoDomainErrorToPresentableErrorMapper) {
        self.getCryptoListUseCase = getCryptoListUseCase
        self.dataMapper = dataMapper
        self.errorMapper = errorMapper
    }

    func onAppear() {
        showLoading.toggle()
        Task {
            let result = await getCryptoListUseCase.execute()
            
            switch result {
                case .success(let cryptos):
                
                    Task { @MainActor in
                        showLoading.toggle()

                        self.cryptos = dataMapper.map(cryptos)
                    }

                case .failure(let error):
                    
                    Task { @MainActor in
                        showLoading.toggle()

                        self.errorMessage = errorMapper.map(error: error)
                    }
            }
        }
    }
    
//    func handleError(error: CryptoDomainError?) {
//        errorMapper.map(error: error)
//    }
}

