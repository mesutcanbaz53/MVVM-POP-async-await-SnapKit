//
//  SearchModel.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

// MARK: - SearchModel
struct SearchModel: Codable {
    var resultCount: Int?
    var results: [Results]?
}

// MARK: - Result
struct Results: Codable {
    let wrapperType, kind: String?
    let artistID, collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let collectionExplicitness, trackExplicitness: String?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country, currency, primaryGenreName: String?
    let releaseDate: String?
    let shortDescription, longDescription : String?
    
    var humanReadableDate : String {
        return releaseDate?.formatHumanReadableDate() ?? "-"
    }
}
