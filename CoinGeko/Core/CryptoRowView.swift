//
//  CryptoRowView.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import SwiftUI

struct CryptoRowView: View {
    
    let crypto: Crypto
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: crypto.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                } placeholder: {
                    ProgressView()
                }
                
                Text(crypto.name)
                    .bold()
            }
            
            Spacer()
            VStack {
                Text(String(crypto.price))
                Text(String(crypto.price24h ?? 0))
                    .foregroundStyle(crypto.price24h ?? 0 < 0 ? .red : .green)
            }
        }
    }
}

#Preview {
    CryptoRowView(
        crypto:         Crypto(
            id: "ethereum",
            name: "Ethereum",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
            price: 100000,
            price24h: 11.55258,
            volume24: 25629998008,
            marketCap: 1374791722320
        )
    )
}
