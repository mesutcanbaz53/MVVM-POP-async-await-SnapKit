//
//  TestSearchViewModelTest.swift
//  POPExampleTests
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import XCTest
@testable import POPExample

class TestSearchViewModelTest: XCTestCase {
    private var sut: SearchViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SearchViewModel(dataSource: SearchDataSource(),
                              apiService: MockService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_set_delegate() throws {
        sut.setDelegate(delegate: SearchViewController(viewModel: sut))
        XCTAssertNotNil(sut.dataSource)
        XCTAssertNotNil(sut.searchViewControllerProtocol)
    }

    func test_save_search_text() throws {
        let text = "Mesut"
        sut.saveSearchedText(text)
        XCTAssertEqual(text, sut.searchedText)
    }
    
    func test_save_filter() throws {
        let filter = SearchSegmentControllerItemsEnum.movies
        sut.saveSelectedFilter(filter)
        XCTAssertEqual(filter.filter, sut.selectedFilter?.filter)
    }
    
    func test_reset_limit() throws {
        sut.resetLimit()
        XCTAssertEqual(0, sut.limit)
    }

    func test_next_limit() throws {
        let firstLimit = 20
        let nextLimit = sut.nextLimit()
        
        XCTAssertEqual(firstLimit, nextLimit)
        
        let limit = 40
        let nextLimit2 = sut.nextLimit()
        XCTAssertEqual(limit, nextLimit2)

    }

    func test_search_api() async throws {
        
        await sut.getSearchService(term: "sera", entity: sut.selectedFilter?.filter ?? SearchSegmentControllerItemsEnum.movies.filter)
        XCTAssertEqual(12, sut.searchResponse?.resultCount)
        XCTAssertNotNil(sut.searchResponse)
        XCTAssertNotNil(sut.dataSource?.searchResponse)
    }
}

class MockService: APIServiceProtocol {
    
    func search(endpoint: APISevicesEndPoint, showLoading: Bool) async -> SearchModel? {
        return SearchModel(resultCount: 12,
                           results: nil)
    }
    
    
}
