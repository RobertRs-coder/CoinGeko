//
//  CoinGekoApp.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 20/3/24.
//

import SwiftUI
import SwiftData

@main
struct CoinGekoApp: App {

    var body: some Scene {
        WindowGroup {
            CryptoListFactory.create()
        }
    }
}
