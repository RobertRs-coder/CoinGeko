//
//  CryptoListViewModel.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation



final class CryptoListViewModel: ObservableObject {
    @Published var cryptos = [CryptoPresentable]()
    @Published var showLoading = false
    private let getCryptoListUseCase: GetCryptoListUseCaseType
    private let presentableDataMapper: CryptoToCryptoPresentableMapper
    
    init(getCryptoListUseCase: GetCryptoListUseCaseType, presentableDataMapper: CryptoToCryptoPresentableMapper) {
        self.getCryptoListUseCase = getCryptoListUseCase
        self.presentableDataMapper = presentableDataMapper
        
        onAppear()

    }

    func onAppear() {
        //TODO: Get data from usecase
        showLoading = true
        Task {
            let result = await getCryptoListUseCase.execute()
            let cryptos = try? result.get().map { presentableDataMapper.map($0) }
            Task { @MainActor in
                
                showLoading = false
                guard let cryptos = cryptos else { return }
                
                //FIXME: NO entiendo porque me devuelve [CryptoPresentable?] si el mapper ya tiene un compactMap para eliminar los opcionales
                self.cryptos = cryptos.compactMap { $0 }
            }
        }
    }
}

