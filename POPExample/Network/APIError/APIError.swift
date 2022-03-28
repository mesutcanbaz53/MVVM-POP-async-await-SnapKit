//
//  APIError.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

///Error handling when preparing request
enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponseStatus
    case dataTaskError(String)
    case corruptData
    case decodingError(String)
    
    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return Logger.http(log: NetworkConstant.invalidURL)
            case .invalidResponseStatus:
                return Logger.http(log: NetworkConstant.invalidResponseStatus)
            case .dataTaskError(let string):
                return Logger.http(log: "❗️❗️❗️ \(string)")
            case .corruptData:
                return Logger.http(log: NetworkConstant.corruptData)
            case .decodingError(let string):
                return Logger.http(log: "❗️❗️❗️ \(string)")
        }
    }
}
