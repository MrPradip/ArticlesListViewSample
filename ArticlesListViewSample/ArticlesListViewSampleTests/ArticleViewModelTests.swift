//
//  ArticleViewModelTests.swift
//  ArticlesListViewSampleTests
//
//  Created by Pradip Kumar on 05/03/25.
//

import XCTest
@testable import ArticlesListViewSample

final class ArticleViewModelTests: XCTestCase {
    
    var viewModel: ArticleViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ArticleViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func testFetchArticlesMockData() {
        let mockJSON = """
        {
          "status": "ok",
          "totalResults": 2,
          "articles": [
            {
              "title": "Mock Article",
              "source": { "name": "MockSource" }
            }
          ]
        }
        """.data(using: .utf8)!

        do {
            let decodedData = try JSONDecoder().decode(ArticleResponse.self, from: mockJSON)
            viewModel.articles = decodedData.articles
            XCTAssertFalse(viewModel.articles.isEmpty, "Articles should not be empty with mock data")
        } catch {
            XCTFail("Failed to decode mock JSON: \(error)")
        }
    }
    
    //  Test if decoding fails with invalid JSON
    func testInvalidJSONDecoding() {
        let invalidJSON = """
            {
              "status": "ok",
              "totalResults": "invalid_data",
              "articles": "not an array"
            }
            """.data(using: .utf8)!
        
        do {
            _ = try JSONDecoder().decode(ArticleResponse.self, from: invalidJSON)
            XCTFail("Decoding should fail for invalid JSON")
        } catch {
            XCTAssertTrue(error is DecodingError, "Error should be of type DecodingError")
        }
    }
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
