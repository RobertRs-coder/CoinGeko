//
//  CryptoListViewModel.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation



final class CryptoListViewModel: ObservableObject {
    @Published var cryptos = [CryptoPresentable]()
    private let getCryptoListUseCase: GetCryptoListUseCaseType
    private let presentableDataMapper: CryptoToCryptoPresentableMapperType
    
    init(getCryptoListUseCase: GetCryptoListUseCaseType, presentableDataMapper: CryptoToCryptoPresentableMapperType) {
        self.getCryptoListUseCase = getCryptoListUseCase
        self.presentableDataMapper = presentableDataMapper
        
        onAppear()

    }

    func onAppear() {
        //TODO: Get data from usecase
        Task {
            let result = await getCryptoListUseCase.execute()
            let cryptos = try? result.get().map { presentableDataMapper.map($0) }
            Task { @MainActor in
                
                guard let cryptos = cryptos else { return }
                
                //FIXME: NO entiendo porque me devuelve [CryptoPresentable?] si el mapper ya tiene un compactMap para eliminar los opcionales
                self.cryptos = cryptos.compactMap { $0 }
            }
        }
    }
}

