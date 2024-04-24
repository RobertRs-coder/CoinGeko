//
//  CryptoListView.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import SwiftUI

struct CryptoListView: View {
    @ObservedObject var viewModel: CryptoListViewModel

    init(viewModel: CryptoListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack{
            
            if viewModel.showLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                if viewModel.errorMessage == nil {
                    List {
                        ForEach(viewModel.cryptos) { crypto in
                            CryptoRowView(crypto: crypto)
                        }
                    }
                    .navigationTitle("Cryptos" )
                    .navigationBarTitleDisplayMode(.inline)
                } else {
                    Text(viewModel.errorMessage ?? "")
                }
            
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .refreshable {
            viewModel.onAppear()
        }  
    }
}


#Preview {
    CryptoListFactory.create()
}
