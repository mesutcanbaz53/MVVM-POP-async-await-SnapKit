//
//  Enums.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

enum SearchSegmentControllerItemsEnum: Int, CaseIterable {
    case movies = 0
    case music
    case ebook
    case podcast
    
    var title: String {
        switch self {
        case .movies:
            return "Movie"
        case .music:
            return "Music"
        case .ebook:
            return "Ebook"
        case .podcast:
            return "Podcast"
        }
    }
    
    var index: Int {
        switch self {
        case .movies:
            return 0
        case .music:
            return 1
        case .ebook:
            return 2
        case .podcast:
            return 3
        }
    }
    
    var filter: String {
        switch self {
        case .movies:
            return "movie"
        case .music:
            return "music"
        case .ebook:
            return "ebook"
        case .podcast:
            return "podcast"
        }
    }
    
}
