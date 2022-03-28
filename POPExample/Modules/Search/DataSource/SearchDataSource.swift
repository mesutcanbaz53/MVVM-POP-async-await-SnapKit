//
//  SearchDataSource.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation
import UIKit

class SearchDataSource: NSObject, SearchDataSourceProtocol {
  
    var searchResponse: SearchModel?
    var searchViewControllerProtocol: SearchViewControllerProtocol?
    private var pendingRequestWorkItem: DispatchWorkItem?
    
    //MARK: - Helper Func
    private func startSearch(searchText :String) {
        pendingRequestWorkItem?.cancel()
        /// Wrap our request in a work item
        let requestWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self else {return}
            if searchText.count > 2 {
                self.searchViewControllerProtocol?.startSearch(searchText)
            }
        }
        /// Save the new work item and execute it after 500 ms
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300),
                                      execute: requestWorkItem)
    }
}

//MARK: - UICollectionView Data Source
extension SearchDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(withType: ItemCell.self, for: indexPath) as! ItemCell
        cell.setCell(result: searchResponse?.results?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let count = searchResponse?.resultCount else { return }
        if indexPath.row == count - 1 {
            searchViewControllerProtocol?.pagination()
        }
    }
    
}

//MARK: - UICollectionView Delegate
extension SearchDataSource: UICollectionViewDelegate {
    
}


//MARK: - SearchBar Delegate
extension SearchDataSource: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchViewControllerProtocol?.emptySearch()
        }
        startSearch(searchText: searchText)
    }
}
