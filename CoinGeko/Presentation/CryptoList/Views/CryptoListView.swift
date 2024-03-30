//
//  CryptoListView.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import SwiftUI

struct CryptoListView: View {
    @ObservedObject var viewModel: CryptoListViewModel

    init(viewModel: CryptoListViewModel = CryptoListViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.cryptos) { crypto in
                    CryptoRowView(crypto: crypto)
                }
            }
            .navigationTitle("Cryptos" )
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}


#Preview {
    CryptoListView()
}
