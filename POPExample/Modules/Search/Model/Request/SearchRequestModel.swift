//
//  SearchRequestModel.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

/// search api request model
struct SearchRequestModel {
    var term: String
    var entity: String
    var limit: Int
}
