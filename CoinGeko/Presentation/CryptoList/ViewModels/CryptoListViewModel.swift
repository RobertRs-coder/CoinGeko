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
        guard let cryptoList = fectchCoins() else { return }
        self.cryptos = cryptoList
    }
    //    init(getCryptoListUseCase: GetCryptoListUseCaseType) {
    //        self.getCryptoListUseCase = getCryptoListUseCase
  
    func fectchCoins() -> [CryptoPresentable]? {
        guard let cryptoListDTOs: [CryptoDTO] = read(filename: "mock-crypto-list-market") else { return []}
        
        return convertDataObject(data: cryptoListDTOs)
        
        //TODO: Get data from usecase
    }
    
    func convertDataObject(data: [CryptoDTO]?) -> [CryptoPresentable] {
        let mockCryptoListData: [CryptoDTO]? = read(filename: "mock-crypto-list-market")
        
        let mockCryptoDomainList = CryptoDTOToCryptoMapper().map(mockCryptoListData ?? [])


        return CryptoToCryptoPresentableMapper().map(mockCryptoDomainList)
    }

    func read<T:Decodable> (filename: String) ->[T]? {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json") else { return [] }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            let result = try? JSONDecoder().decode([T].self, from: jsonData)
            
            if let result = result {
                return result
            } else {
                return []
            }

        } catch {
            print(error.localizedDescription)
        }
        return []
        
    }
}

