//
//  SearchProtocols.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

protocol SearchViewControllerProtocol {
    
    func setSearchCollectionData()
    func startSearch(_ text: String)
    func emptySearch()
    func pagination()
    func showHideEmptyMessageView(_ isHidden: Bool)

    init(viewModel: SearchViewModelProtocol)
   
}

protocol SearchViewModelProtocol {
    var dataSource: SearchDataSource? { get set }
    var apiService: APIServiceProtocol? { get set }
    var searchViewControllerProtocol: SearchViewControllerProtocol? { get set }
    var searchResponse: SearchModel? { get set }
    var selectedFilter: SearchSegmentControllerItemsEnum? { get set }
    var searchedText: String? { get set }
    var limit: Int { get set }
    
    func setDelegate(delegate: SearchViewControllerProtocol)
    func getSearchService(term: String, entity: String) async
    func saveSelectedFilter(_ filter: SearchSegmentControllerItemsEnum)
    func saveSearchedText(_ searchText: String)
    func nextLimit() -> Int
    func resetLimit()
}

protocol SearchDataSourceProtocol {
    var searchResponse: SearchModel? { get set }
    var searchViewControllerProtocol: SearchViewControllerProtocol? { get set }    
}
