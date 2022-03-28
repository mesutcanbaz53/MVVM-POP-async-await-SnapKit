//
//  SearchViewController.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation
import UIKit
import SnapKit

final class SearchViewController: BaseViewController {
    
    //MARK: - Views
    private lazy var searchController: UISearchController = {
        let view = UISearchController(searchResultsController: nil)
        view.searchBar.delegate = viewModel?.dataSource
        return view
    }()
    
    private lazy var segmentController: UISegmentedControl = {
        let items = SearchSegmentControllerItemsEnum.allCases.map{$0.title}
        let view = UISegmentedControl(items: items)
        view.selectedSegmentIndex = SearchSegmentControllerItemsEnum.movies.index
        view.addTarget(self,
                       action: #selector(didTappedSearchSegmentController(_:)),
                       for: .valueChanged)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 24) / 2,
                                 height: 240)
        layout.minimumInteritemSpacing = 8.0
        layout.minimumLineSpacing = 8.0
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.setup(cells: [ItemCell.self])
        collectionView.contentInset = UIEdgeInsets(top: .zero,
                                                   left: .zero,
                                                   bottom: 8,
                                                   right: .zero)
        collectionView.delegate = viewModel?.dataSource
        collectionView.dataSource = viewModel?.dataSource
        return collectionView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [segmentController,
                                                 collectionView])
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 8.0
        view.axis = .vertical
        return view
    }()
    
    //MARK: - Properties
    private let viewModel: SearchViewModelProtocol?
    
    //MARK: - Life Cycle
    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setUpNavBar()
        viewModel?.setDelegate(delegate: self)
    }
    
    //MARK: - UI Configurations
    override func setUpViews() {
        view.addSubview(containerStackView)
    }
    
    override func setUpConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        segmentController.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
    }
    
    override func setBackgroundColor() {
        super.setBackgroundColor()
        setBackgroundColor(.white)
    }
    
    override func setUpNavBar() {
        setNavbarWithSearchBar(searchController: searchController,
                               title: "Search",
                               hidesSearchBarWhenScrolling: false)
    }
    
    //MARK: - Actions
    @objc
    func didTappedSearchSegmentController(_ segment: UISegmentedControl) {
        collectionView.scrollToTop()
        viewModel?.resetLimit()
        guard let item = SearchSegmentControllerItemsEnum(rawValue: segmentController.selectedSegmentIndex) else {
            Logger.Log(item: segmentController, . isNil)
            return
        }
        viewModel?.saveSelectedFilter(item)
        guard !(searchController.searchBar.text?.isEmpty ?? false) else {
            Logger.Log(item: searchController.searchBar , .isNil)
            return
        }
        
        Task {
            await viewModel?.getSearchService(term: viewModel?.searchedText ?? "",
                                              entity: viewModel?.selectedFilter?.filter ?? SearchSegmentControllerItemsEnum.movies.filter)
        }
    }
}

//MARK: - Protocols
extension SearchViewController: SearchViewControllerProtocol {
    func startSearch(_ text: String) {
        viewModel?.saveSearchedText(text)
        viewModel?.resetLimit()
        Task {
            await viewModel?.getSearchService(term: text,
                                              entity: viewModel?.selectedFilter?.filter ?? SearchSegmentControllerItemsEnum.movies.filter)
        }
    }
    
    func emptySearch() {
        viewModel?.saveSearchedText("")
        viewModel?.resetLimit()
        collectionView.showHideEmptyMessageView(false)
        collectionView.reloadData()
    }
    
    func setSearchCollectionData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func pagination() {
        Task {
            await viewModel?.getSearchService(term: viewModel?.searchedText ?? "",
                                              entity: viewModel?.selectedFilter?.filter ?? SearchSegmentControllerItemsEnum.movies.filter)
        }
    }
    
    func showHideEmptyMessageView(_ isHidden: Bool) {
        collectionView.showHideEmptyMessageView(isHidden)
    }
    
}
