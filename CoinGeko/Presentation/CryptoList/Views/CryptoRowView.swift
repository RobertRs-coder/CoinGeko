//
//  CryptoRowView.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 30/3/24.
//

import SwiftUI

struct CryptoRowView: View {
    
    let crypto: CryptoPresentable
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                AsyncImage(url: URL(string: crypto.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                } placeholder: {
                    ProgressView()
                }
                Image(systemName: "heart.circle")
                    .foregroundStyle(.black)
                
            }
             
                    Text(crypto.name)
                        .bold()

                
                
            }
            Spacer()
            VStack {
                Text(crypto.price)
                Text(Double(crypto.price24h) ?? 0 > 0 ? "+\(crypto.price24h)" : crypto.price24h)
                    .foregroundStyle(Double(crypto.price24h) ?? 0 < 0 ? .red : .green)
                
            }
        }
    }
}

#Preview {
    CryptoRowView( 
        crypto:
            CryptoPresentable(
                id: "ethereum",
                name: "Ethereum",
                image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                price: "100000",
                price24h: "11.55258",
                marketCap: "1374791722320",
                marketCap24h: "25629998008"
            )
    )
}
