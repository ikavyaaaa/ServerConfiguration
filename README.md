# ServerConfiguration

A simple server configuration manager for managing different base URLs (Development, Staging, and Production) based on the target environment in an iOS application. This project utilizes conditional compilation to dynamically switch between server environments during runtime.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Accessing the Base URL](#accessing-the-base-url)
  - [Example API Call](#example-api-call)
- [Contributing](#contributing)
- [License](#license)

## Overview

The **Server Configuration Manager** is designed to handle different base URLs based on the environment in which the app is running (Development, Staging, or Production). By using conditional compilation flags, the application selects the appropriate base URL depending on the target configuration.

This approach makes it easy to switch between different server environments without needing to change code or hardcode URLs.

## Features

- **Environment-specific URLs**: Supports multiple environments, including Development, Staging, and Production.
- **Conditional Compilation**: Dynamically switches base URLs using Swift's compiler flags.
- **Simple API Integration**: Easy to integrate with API calls by simply using the `baseURL` in the `AppAPIManager`.

## Installation

To use the **Server Configuration Manager** in your iOS project, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/ikavyaaaa/ServerConfiguration.git
   
2. **Add the code to your project**:

   - Copy the ServerConfiguration.swift file into your iOS project.
   - Ensure that you have set up the correct build configurations (Development, Staging, and Production).

3. **Configure the build flags**:

    - Go to Build Settings in Xcode.
    - Add the following flags under Swift Compiler - Custom Flags > Other Swift Flags:
        - DEV for Development
        - STAGING for Staging
        - PROD for Production

3. **Select the appropriate scheme**:

    - In Xcode, ensure the scheme corresponds to the configuration you want to use (e.g., Staging, Production).


## Usage

 ## Accessing the Base URL
 
  - The base URL is automatically selected based on the active build configuration. Use the ServerConfiguration.baseURL to retrieve the URL for the current environment.

   ```bash
   class AppAPIManager {
    
    static let shared = AppAPIManager()
    
    private init(){}
    
    let baseURL = ServerConfiguration.baseURL.absoluteString
    
    // API call example
    func fetchData(from endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: baseURL)?.appendingPathComponent(endpoint) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}

## Example API Call

- Here’s how to use the AppAPIManager to fetch data from the server:


   ```bash
   AppAPIManager.shared.fetchData(from: "users") { result in
    switch result {
    case .success(let data):
        print("Received data: \(data)")
    case .failure(let error):
        print("Error occurred: \(error.localizedDescription)")
    }
}

- This will automatically use the correct base URL (https://staging.com/mobile/api/v1.0/ for Staging) depending on the build configuration.


## Contributing

- We welcome contributions to this project. Please follow the steps below to contribute:

    - Fork the repository.
    - Create a new branch for your feature or bug fix.
    - Make your changes and commit them with descriptive messages.
    - Submit a pull request to the main branch.

## Coding Guidelines:

- Follow Swift's best practices for naming conventions and formatting.
- Ensure your code passes linting and unit tests before submitting a pull request.

## License

- This project is licensed under the MIT License - see the LICENSE file for details.



### Explanation of Sections:
- **Overview**: Brief introduction to what the project does.
- **Features**: Key highlights and benefits of using the configuration manager.
- **Installation**: Steps to get the code and integrate it into your project.
- **Usage**: Details on how to access the base URL and an example of using it for an API call.
- **Contributing**: How others can contribute to the project, including fork/branch guidelines.
- **License**: Information about the license type for your repository.

This structure is clear, easy to follow, and contains all the necessary information for users or contributors.

