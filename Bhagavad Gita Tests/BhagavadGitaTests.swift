//
//  BhagavadGitaTests.swift
//  Bhagavad Gita Tests
//
//  Created by Ayush Singhal on 17/09/23.
//

import XCTest
@testable import Bhagavad_Gita

class BhagavadGitaTests:XCTestCase{
    func testBookmarksViewModel(){
        let viewModel = BookmarksViewModel.instance
        XCTAssertNotNil(viewModel)
    }
}
