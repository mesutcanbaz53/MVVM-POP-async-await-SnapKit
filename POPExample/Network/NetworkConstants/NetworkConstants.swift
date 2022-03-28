//
//  NetworkConstants.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

enum StatusCode: Int {
    case success = 200
}

///Base url for request
class NetworkConstant {
    static var BASE_URL = "https://itunes.apple.com/search"
}

///Error mesages for pre request
extension NetworkConstant {
    static var invalidURL = "❗️❗️❗️ The endpoint URL is invalid"
    static var invalidResponseStatus = "❗️❗️❗️ The API failed to issue a valid response."
    static var corruptData =  "❗️❗️❗️ The data provided appears to be corrupt"
}
