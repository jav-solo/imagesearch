//
//  ImageSourceEndpointTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Testing
@testable import imagesearch

struct ImageSourceEndpointTests {
    @Test func testImageSourceEndpoint() async throws {
        let expectedImgurGallerySearchString = "https://api.imgur.com/3/gallery/search/"
        #expect(ImageSourceEndpoint.imgurGallerySearch.rawValue == expectedImgurGallerySearchString)
    }
}
