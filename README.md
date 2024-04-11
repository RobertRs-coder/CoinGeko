# CoinGeko

##SetUp

Secure your API Key using a .plist
To use CoinGeko safely without hardcoding your API key, follow these steps:

- Create a .plist file: Add a new .plist file to your project called Config.plist.
- Add your API Key: Inside Config.plist, add a new row with the Key CoinGeko_API_Key and paste your API key in the Value field.
- Load the API Key: Use the following code to load your API key from the .plist:
```
import Foundation
// Define a struct to handle configuration settings.
struct Config {
    // Static variable to access the CoinGeko API key.
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
```
- Inside your Request set the header value:
  ```
    request.setValue(Config.coinGekoApiKey, forHTTPHeaderField: "x-cg-demo-api-key")
  ```
## Use Case

### Get Crypto List with Market Cap

#### Dependency Diagram

![Dependency diagram Get Crypto List Use Case](./docs/images/CoinGeko-DependencyDiagram-GetCryptoListUseCase.png)
