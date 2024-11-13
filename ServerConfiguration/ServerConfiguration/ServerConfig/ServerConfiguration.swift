//
//  ServerConfiguration.swift
//  ServerConfiguration
//
//  Created by Kavya Krishna K. on 13/11/24.
//

import Foundation

enum ServerConfiguration {
    static var BASE_URL: URL {
        var urlString: String
        
        #if DEV
        urlString = "https://dev.com/api/"
        print("Development URL selected")
        #elseif STAGING
        urlString = "https://staging.com/api/"
        print("Staging URL selected")
        #elseif PRODUCTION
        urlString = "https://production.com/api/"
        print("Production URL selected")
        #else
        print("No configuration matched")
        #endif
        
        print("Base URL: \(urlString)")
        
        guard let url = URL(string: urlString), !urlString.isEmpty else {
            fatalError("BASE_URL is not a valid URL")
        }
        return url
    }
    
    static var DMS_BASE_URL: URL {
        var urlString: String
        
        #if DEV
        urlString = "https://dms.dev.com/api/v3/devices/"
        print("Development DMS_URL selected")
        #elseif STAGING
        urlString = "https://dms.staging.com/api/v3/devices/"
        print("Staging DMS_URL selected")
        #elseif PRODUCTION
        urlString = "https://dms.production.com/api/v3/devices/"
        print("Production DMS_URL selected")
        #else
        print("No configuration matched")
        #endif
        
        print("Base URL: \(urlString)")
        
        guard let url = URL(string: urlString), !urlString.isEmpty else {
            fatalError("BASE_URL is not a valid URL")
        }
        return url
    }
}
