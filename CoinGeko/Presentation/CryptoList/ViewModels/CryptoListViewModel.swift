//
//  CryptoListViewModel.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import Foundation


final class CryptoListViewModel: ObservableObject {
    @Published var cryptos = [CryptoPresentable]()
//    private let getCryptoListUseCase: GetCryptoListUseCaseType
//    private let presentableDataMapper: CryptoToCryptoPresentableMapperType
//    private let presentableErrorMapper: DomainErrorToPresentableErrorType
//    private var error: String
//    //MARK: -
    init() {
        self.cryptos = mockCryptoList
    }
//    init(getCryptoListUseCase: GetCryptoListUseCaseType) {
//        self.getCryptoListUseCase = getCryptoListUseCase
    
//        fectchCoins()
//    }
//    
//    func fectchCoins() {
//        Task {
//            let result = await getCryptoListUseCase.execute()
//            
//            switch result {
//                case .failure(let error):
//                    self.error = presentableErrorMapper.map(error) ?? "print"
//                case .success(let cryptos):
//                    self.cryptos = presentableDataMapper.map(cryptos)
//                    
//            }
//
//        }
//    }
}
