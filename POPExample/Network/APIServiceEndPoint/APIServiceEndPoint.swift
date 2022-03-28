//
//  APIServiceEndPoint.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

enum APISevicesEndPoint {
    /// endpoints
    case search(request: SearchRequestModel)
    
    ///fullPath
    var endPoint: String {
        switch self {
            case .search(let request):
                let requestableText = request.term.replacingOccurrences(of: " ", with: "+")
                return "?term=\(requestableText)&entity=\(request.entity)&limit=\(request.limit)"
        }
    }
}
