//
//  HTTPMethodTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Testing
@testable import imagesearch

struct HTTPMethodTests {

    @Test func testHTTPMethodRawValues() async throws {
        let expectedString = "GET"
        #expect(HTTPMethod.get.rawValue == expectedString)
    }

}
