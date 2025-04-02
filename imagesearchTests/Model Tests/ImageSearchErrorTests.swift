//
//  ImageSearchErrorTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Testing
@testable import imagesearch

struct ImageSearchErrorTests {

    @Test func testImageSearchErrorDescriptions() async throws {
        let expectedNetworkIssueDescription = "There was a network issue. Please try again later."
        #expect(ImageSearchError.networkIssue.customerDescription == expectedNetworkIssueDescription)
        
        let expectedNoResultsDescription = "No Results Found"
        #expect(ImageSearchError.noResults.customerDescription == expectedNoResultsDescription)
    }

}
