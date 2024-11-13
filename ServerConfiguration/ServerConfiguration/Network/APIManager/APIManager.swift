//
//  APIManager.swift
//  ServerConfiguration
//
//  Created by Kavya Krishna K. on 13/11/24.
//

import Foundation

class AppAPIManager {
    
    static let shared = AppAPIManager()
    
    private init(){}
    
    // Base URL for the API
    let baseURL = ServerConfiguration.BASE_URL.absoluteString
    
    // Base DMSURL for the API
    let baseDMSURL = ServerConfiguration.DMS_BASE_URL.absoluteString
    
    // Function to make a GET request to the server
    func fetchData(from endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
        // Construct the full URL by appending the endpoint to the base URL
        guard let url = URL(string: baseURL)?.appendingPathComponent(endpoint) else {
            print("Invalid URL")
            return
        }
        
        guard let dmsUrl = URL(string: baseDMSURL)?.appendingPathComponent(endpoint) else {
            print("Invalid baseDMSURL")
            return
        }
        
        // Create the URLRequest for the GET request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Start the network request
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle the response or error
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "com.app.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received."])
                completion(.failure(error))
                return
            }
            
            // Return the fetched data
            completion(.success(data))
        }.resume()
    }
}
