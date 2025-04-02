//
//  SystemInfoTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Foundation
import Testing
@testable import imagesearch

struct SystemInfoTests {

    @Test func testSystemInfo() async throws {
        let prodSystemInfo = SystemInfo.prod
        
        #expect(prodSystemInfo.dataRetriever is URLSession)
        #expect(prodSystemInfo.userDefaults is UserDefaults)
        
        let testSystemInfo = SystemInfo.test
        #expect(testSystemInfo.dataRetriever is StubDataRetriever)
        #expect(testSystemInfo.userDefaults is FakeUserDefaults)
    }
}
