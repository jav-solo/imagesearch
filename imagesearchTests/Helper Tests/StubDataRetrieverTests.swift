//
//  StubDataRetrieverTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Foundation
import Testing
@testable import imagesearch

struct StubDataRetrieverTests {
    @Test func testStubDataRetriever() async throws {
        let fakeURLRequest = URLRequest(url: URL(filePath: "FakeURL"))
        
        var stubDataRetriever = StubDataRetriever(response: .bad)
        var data = try? await stubDataRetriever.data(for: fakeURLRequest, delegate: nil)
        
        let failedStatusCode = (data?.1 as? HTTPURLResponse)?.statusCode
        #expect(failedStatusCode != 200)

        stubDataRetriever = StubDataRetriever(response: .empty)
        data = try? await stubDataRetriever.data(for: fakeURLRequest, delegate: nil)
        let succeededStatusCode = (data?.1 as? HTTPURLResponse)?.statusCode
        #expect(succeededStatusCode == 200)
        
        stubDataRetriever = StubDataRetriever(response: .good)
        data = try? await stubDataRetriever.data(for: fakeURLRequest, delegate: nil)
        let succeededStatusCodeTwo = (data?.1 as? HTTPURLResponse)?.statusCode
        #expect(succeededStatusCodeTwo == 200)
    }

}
