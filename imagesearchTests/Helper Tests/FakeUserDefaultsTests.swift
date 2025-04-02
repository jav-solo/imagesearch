//
//  FakeUserDefaultsTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Testing
@testable import imagesearch

struct FakeUserDefaultsTests {

    @Test func testFakeUserDefaults() async throws {
        // Test Retrieval
        let fakeUserDefaults = FakeUserDefaults()
        #expect(fakeUserDefaults.dictionary(forKey: "fooBar") as? [String: String] == [:])
        
        fakeUserDefaults.set(["Foo": "Bar"], forKey: "fooBar")
        #expect(fakeUserDefaults.dictionary(forKey: "fooBar") as? [String: [String: String]] == ["fooBar": ["Foo": "Bar"]])
    }

}
