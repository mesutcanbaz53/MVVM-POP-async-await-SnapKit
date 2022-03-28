//
//  BaseViewControllerProtocol.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol: AnyObject {}

extension BaseViewControllerProtocol where Self: UIViewController {

    ///MARK: - setup for background color
    func setBackgroundColor(_ color: UIColor = .white) {
        view?.backgroundColor = color
    }
    
    ///MARK: - setup for navigation controller with searchbar
    func setNavbarWithSearchBar(searchController: UISearchController,
                                title: String,
                                hidesSearchBarWhenScrolling: Bool = true) {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = hidesSearchBarWhenScrolling
        navigationItem.title = title
    }
    
    ///MARK: -  basic setup for navigation controller
    func setNavbar(title: String) {
        navigationItem.title = title
    }
}
