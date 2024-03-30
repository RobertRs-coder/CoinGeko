//
//  CryptoListView.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import SwiftUI

struct Crypto: Identifiable {
    let id: String
    let name: String
    let image: String
    let price: Double
    let price24h: Double?
    let volume24: Double?
    let marketCap: Double?
    
}



struct CryptoListView: View {
    
    let cryptos: [Crypto] = [
        Crypto(
            id: "bitcoin",
            name: "Bitcoin",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
            price: 69890,
            price24h: -1.55258,
            volume24: 25629998008,
            marketCap: 1374791722320
        ),
        Crypto(
            id: "ripple",
            name: "Ripple",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
            price: 69890,
            price24h: 10.55258,
            volume24: 25629998008,
            marketCap: 1374791722320
        ),
        Crypto(
            id: "ethereum",
            name: "Ethereum",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
            price: 100000,
            price24h: 11.55258,
            volume24: 25629998008,
            marketCap: 1374791722320
        )
    ]
    
    var body: some View {
        //        Text("Favourites")
        NavigationStack{
            List {
                
                ForEach(cryptos) { crypto in
                    CryptoRowView(crypto: crypto)
                    
                }
            }
            .navigationTitle("Favourites" )
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}


#Preview {
    CryptoListView()
}
