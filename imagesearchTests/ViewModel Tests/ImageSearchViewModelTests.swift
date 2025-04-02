//
//  ImageSearchViewModelTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Testing
@testable import imagesearch

struct ImageSearchViewModelTests {

    @Test func testImageSearchViewModel() async throws {
        let imageSearchViewModel = ImageSearchViewModel()
        let state = imageSearchViewModel.state
        #expect(state == .loaded(images: []))
        
        Current.dataRetriever = StubDataRetriever(response: .bad)
        await imageSearchViewModel.loadImages(for: "foo")
        #expect(imageSearchViewModel.state == ImageSearchViewModel.State.error(error: .networkIssue))
        
        Current.dataRetriever = StubDataRetriever(response: .empty)
        await imageSearchViewModel.loadImages(for: "foo")
        #expect(imageSearchViewModel.state == ImageSearchViewModel.State.error(error: .noResults))
        
        imageSearchViewModel.clearResults()
        #expect(imageSearchViewModel.state == ImageSearchViewModel.State.loaded(images: []))
        
        Current.dataRetriever = StubDataRetriever(response: .good)
        await imageSearchViewModel.loadImages(for: "foo")
        #expect(imageSearchViewModel.state == ImageSearchViewModel.State.loaded(images: []))
        
        imageSearchViewModel.save(search: "bar")
        #expect(imageSearchViewModel.recents.contains { $0 == "bar"})
    }

}
