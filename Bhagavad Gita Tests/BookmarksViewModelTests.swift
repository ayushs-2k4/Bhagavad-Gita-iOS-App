//
//  BhagavadGitaTests.swift
//  Bhagavad Gita Tests
//
//  Created by Ayush Singhal on 17/09/23.
//

@testable import Bhagavad_Gita
import XCTest

class BookmarksViewModelTests: XCTestCase {
    var bookmarksViewModel: BookmarksViewModel!

    override func setUp() {
        super.setUp()
        bookmarksViewModel = BookmarksViewModel.instance
    }

    override func tearDown() {
        bookmarksViewModel = nil
        super.tearDown()
    }

    func testAddBookmark() {
        // Given
        let chapterNumber = 1
        let slokNumber = 10

        // When
        bookmarksViewModel.addBookmark(chapterNumber: chapterNumber, slokNumber: slokNumber)

        // Then
        XCTAssertTrue(bookmarksViewModel.isBookmarked(chapterNumber: chapterNumber, slokNumber: slokNumber))
    }

    func testDeleteBookmark() {
        // Given
        let chapterNumber = 2
        let slokNumber = 5
        bookmarksViewModel.addBookmark(chapterNumber: chapterNumber, slokNumber: slokNumber)

        // When
        bookmarksViewModel.deleteBookmark(chapterNumber: chapterNumber, slokNumber: slokNumber)

        // Then
        XCTAssertFalse(bookmarksViewModel.isBookmarked(chapterNumber: chapterNumber, slokNumber: slokNumber))
    }
    
    func testBookmarkExistence() {
            // Given
            let chapterNumber = 3
            let slokNumber = 15

            // When
            bookmarksViewModel.addBookmark(chapterNumber: chapterNumber, slokNumber: slokNumber)

            // Then
            XCTAssertTrue(bookmarksViewModel.isBookmarked(chapterNumber: chapterNumber, slokNumber: slokNumber))
        }

        func testSaveAndRetrieveBookmarks() {
            // Given
            let chapterNumber = 4
            let slokNumber = 20
            bookmarksViewModel.addBookmark(chapterNumber: chapterNumber, slokNumber: slokNumber)

            // When
            bookmarksViewModel.saveBookmarks()
            bookmarksViewModel.getBookmarks()

            // Then
            XCTAssertTrue(bookmarksViewModel.isBookmarked(chapterNumber: chapterNumber, slokNumber: slokNumber))
        }

    func testBookmarksViewModel() {
        let viewModel = BookmarksViewModel.instance
        XCTAssertNil(viewModel)
    }
}
