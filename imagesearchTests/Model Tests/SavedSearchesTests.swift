//
//  SavedSearchesTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Testing
@testable import imagesearch

struct SavedSearchesTests {
    @Test func testSavedSearches() async throws {
        let expectedSearchResults = Array(["Apple", "Banana", "Orange"].reversed())
        let savedSearch = SavedSearch()
        #expect(savedSearch.sortedResults.isEmpty)
        
        savedSearch.insert(query: "Apple")
        savedSearch.insert(query: "Banana")
        savedSearch.insert(query: "Orange")
        
        #expect(savedSearch.sortedResults == expectedSearchResults)
        
        let expectedMaximum = 10
        savedSearch.insert(query: "Pineapple")
        savedSearch.insert(query: "Mango")
        savedSearch.insert(query: "Kiwi")
        savedSearch.insert(query: "Lemon")
        savedSearch.insert(query: "Grape")
        savedSearch.insert(query: "Strawberry")
        savedSearch.insert(query: "Blueberry")
        savedSearch.insert(query: "Blackberry")
        savedSearch.insert(query: "Cherry")
        savedSearch.insert(query: "Plum")
        
        let newExpectedSearchResults = ["Plum", "Cherry", "Blackberry", "Blueberry", "Strawberry", "Grape", "Lemon", "Kiwi", "Mango", "Pineapple"]
        
        #expect(savedSearch.sortedResults.count == expectedMaximum)
        #expect(savedSearch.sortedResults == newExpectedSearchResults)
    }

}
