//
//  APIService.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation
import UIKit

protocol APIServiceProtocol {
    func search(endpoint: APISevicesEndPoint, showLoading: Bool) async -> SearchModel?
}

struct APIService {
    let BASE_URL = NetworkConstant.BASE_URL
    
    
    func getJSON<T: Decodable>(_ endpoint: APISevicesEndPoint, loading: Bool = true) async throws -> T {
        
        /// encode for turkish characters
        guard let encodedURL = "\(BASE_URL)\(endpoint.endPoint)".encodedURL() else {
            throw APIError.invalidURL
        }
        
        guard let url = URL(string: encodedURL) else {
            throw APIError.invalidURL
        }
        
        Logger.request(log: "Request: \(url)")
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      throw APIError.invalidResponseStatus
                  }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                Logger.response(log: data.prettyPrintedJSONString ?? "")
                return decodedData
            } catch {
                throw APIError.decodingError(error.localizedDescription)
            }
        } catch {
            throw APIError.dataTaskError(error.localizedDescription)
        }
    }
}

//MARK: - SERVICE
extension APIService: APIServiceProtocol {
   
    func search(endpoint: APISevicesEndPoint, showLoading: Bool) async -> SearchModel? {
        var response: SearchModel?
        do {
            response = try await getJSON(endpoint, loading: showLoading)
        } catch {
            /// show error popup or log
            print(error.localizedDescription)
        }
        
        return response
    }
}

//MARK: - Loading
extension APIService {
    
  
}
