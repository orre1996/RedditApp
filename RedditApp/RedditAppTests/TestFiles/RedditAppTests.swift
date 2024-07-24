//
//  RedditAppTests.swift
//  RedditAppTests
//
//  Created by Oscar Berggren on 2024-07-24.
//

import XCTest
@testable import RedditApp

@MainActor
final class RedditAppTests: XCTestCase {
    var repository: SubredditRepositoryProtocol!
    var viewModel: SubredditListViewModel!

    override func tearDownWithError() throws {
        repository = nil
        viewModel = nil
    }
    
    func testPostsSort() async {
        repository = SubredditRepositoryMock(result: .success(TestDataManager().swiftUIPosts))
        viewModel = SubredditListViewModel(subredditRepository: repository)

        await viewModel.getSubreddit(.swiftui)
    
        if case .post(let post) = viewModel.rows.first {
            XCTAssertEqual(post.data.title, "Which SF font is the default Text label?")
        } else {
            XCTFail("Expected condition to be .post, but it's not")
        }
    }

    func testTimeAgo() async {
        repository = SubredditRepositoryMock(result: .success(TestDataManager().swiftUIPosts))
        viewModel = SubredditListViewModel(subredditRepository: repository)

        await viewModel.getSubreddit(.swiftui)
        
        if case .post(let post) = viewModel.rows[6] {
            let nowDate = Date.setTime(year: 2024, month: 07, day: 24, hour: 12, min: 15)!
            XCTAssertEqual(post.data.postedAgo(setDate: nowDate), "Just now")
        } else {
            XCTFail("Expected condition to be .post but it's not")
        }

        if case .post(let post) = viewModel.rows[12] {
            let hoursDate = Date.setTime(year: 2024, month: 07, day: 24, hour: 12, min: 0)!
            XCTAssertEqual(post.data.postedAgo(setDate: hoursDate), "16 hours ago")
        } else {
            XCTFail("Expected condition to be .post but it's not")
        }
    
        if case .post(let post) = viewModel.rows[4] {
            let daysDate = Date.setTime(year: 2024, month: 07, day: 26, hour: 4, min: 0)!
            XCTAssertEqual(post.data.postedAgo(setDate: daysDate), "1 day ago")
        } else {
            XCTFail("Expected condition to be .post but it's not")
        }
    }

    func testSubredditFailure() async {
        repository = SubredditRepositoryMock(result: .failure(.invalidResponse))
        viewModel = SubredditListViewModel(subredditRepository: repository)

        await viewModel.getSubreddit(.swiftui)

        if case .error = viewModel.rows.first {
            XCTAssertTrue(true, "Expected condition to error, and it is")
        } else {
            XCTFail("Expected condition to be .error, but it's not")
        }
    }
}
