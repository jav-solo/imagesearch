//
//  AppSectionTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Testing
@testable import imagesearch

struct AppSectionTests {
    @Test func testAppSection() async throws {
        let expectedSearchTitle = "Search"
        let expectedSearchImageName = "magnifyingglass"
        #expect(AppSection.search.title == expectedSearchTitle)
        #expect(AppSection.search.imageName == expectedSearchImageName)
        
        let expectedGalleryTitle = "Gallery"
        let expectedGalleryImageName = "photo.on.rectangle.angled"
        #expect(AppSection.gallery.title == expectedGalleryTitle)
        #expect(AppSection.gallery.imageName == expectedGalleryImageName)
    }
}
