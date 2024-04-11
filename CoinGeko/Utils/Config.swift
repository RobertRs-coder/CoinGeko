//
//  Config.swift
//  CoinGeko
//
//  Created by Roberto Rojo Sahuquillo on 11/4/24.
//

import Foundation

// Define a struct to handle configuration settings.
struct Config {
    // Static variable to access the OpenAI API key.
    static var coinGekoApiKey: String {
        get {
            // Attempt to find the path of 'Config.plist' in the main bundle.
            guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
                // If the file is not found, crash with an error message.
                fatalError("Couldn't find file 'Config.plist'.")
            }
            
            // Load the contents of the plist file into an NSDictionary.
            let plist = NSDictionary(contentsOfFile: filePath)
            
            // Attempt to retrieve the value for the 'OpenAI_API_Key' from the plist.
            guard let value = plist?.object(forKey: "CoinGeko_API_Key") as? String else {
                // If the key is not found in the plist, crash with an error message.
                fatalError("Couldn't find key 'OpenAI_API_Key' in 'Config.plist'.")
            }
            
            // Return the API key.
            return value
        }
    }
}
