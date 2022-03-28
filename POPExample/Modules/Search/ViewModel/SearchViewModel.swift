//
//  SearchViewModel.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation

final class SearchViewModel: SearchViewModelProtocol {
   
    var dataSource: SearchDataSource?
    var apiService: APIServiceProtocol?
    var searchViewControllerProtocol: SearchViewControllerProtocol?
    var searchResponse: SearchModel?
    var selectedFilter: SearchSegmentControllerItemsEnum?
    var searchedText: String?
    var limit: Int = 0
    
    init(dataSource: SearchDataSource, apiService: APIServiceProtocol) {
        self.dataSource = dataSource
        self.apiService = apiService
    }
    
    func setDelegate(delegate: SearchViewControllerProtocol) {
        searchViewControllerProtocol = delegate
        dataSource?.searchViewControllerProtocol = delegate
    }
        
    func saveSelectedFilter(_ filter: SearchSegmentControllerItemsEnum) {
        selectedFilter = filter
        resetLimit()
    }
    
    func saveSearchedText(_ searchText: String) {
        searchedText = searchText
    }
    
    func nextLimit() -> Int {
        limit += 20
        return limit
    }
    
    func resetLimit() {
        limit = 0
    }
    
    ///show and hide empty message depends on response count and limit
    private func showHideEmptyMessage() {
        if (searchResponse?.resultCount == 0 || searchResponse?.resultCount == nil) && limit == 20 {
            searchViewControllerProtocol?.showHideEmptyMessageView(false)
        } else {
            searchViewControllerProtocol?.showHideEmptyMessageView(true)
        }
    }
    
    //MARK: - Service Calls
    func getSearchService(term: String, entity: String) async {
        guard limit < 150 else { return }
        let requestModel = SearchRequestModel(term: term,
                                              entity: entity,
                                              limit: nextLimit())
        searchResponse = await apiService?.search(endpoint: .search(request: requestModel), showLoading: true)
        dataSource?.searchResponse = searchResponse
        showHideEmptyMessage()
        searchViewControllerProtocol?.setSearchCollectionData()
    }
}
