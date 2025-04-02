//
//  SearchSuggestionTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Testing
@testable import imagesearch

struct SearchSuggestionTests {

    @Test func testSearchSuggestionsTitles() async throws {
        let expectedCatsTitle = "Cats"
        #expect(expectedCatsTitle == SearchSuggestion.cats.title)
        
        let expectedDogsTitle = "Dogs"
        #expect(expectedDogsTitle == SearchSuggestion.dogs.title)
        
        let expectedRomeTitle = "Rome"
        #expect(expectedRomeTitle == SearchSuggestion.rome.title)
        
        let expectedParisTitle = "Paris"
        #expect(expectedParisTitle == SearchSuggestion.paris.title)
        
        let expectedSanFranciscoTitle = "San Francisco"
        #expect(expectedSanFranciscoTitle == SearchSuggestion.sanFrancisco.title)
        
        let expectedNewYorkTitle = "New York"
        #expect(expectedNewYorkTitle == SearchSuggestion.newYork.title)
        
        let expectedAirplanesTitle = "Airplanes"
        #expect(expectedAirplanesTitle == SearchSuggestion.airplanes.title)
        
        let expectedCarsTitle = "Cars"
        #expect(expectedCarsTitle == SearchSuggestion.cars.title)
        
        let expectedMotorcyclesTitle = "Motorcycles"
        #expect(expectedMotorcyclesTitle == SearchSuggestion.motorcycles.title)
    }
    
    @Test func testSearchSuggestionsImageNames() async throws {
        let expectedCatsImageName = "cats"
        #expect(expectedCatsImageName == SearchSuggestion.cats.imageName)
        
        let expectedDogsImageName = "dogs"
        #expect(expectedDogsImageName == SearchSuggestion.dogs.imageName)
        
        let expectedRomeImageName = "rome"
        #expect(expectedRomeImageName == SearchSuggestion.rome.imageName)
        
        let expectedParisImageName = "paris"
        #expect(expectedParisImageName == SearchSuggestion.paris.imageName)
        
        let expectedSanFranciscoImageName = "san-francisco"
        #expect(expectedSanFranciscoImageName == SearchSuggestion.sanFrancisco.imageName)
        
        let expectedNewYorkImageName = "new-york"
        #expect(expectedNewYorkImageName == SearchSuggestion.newYork.imageName)
        
        let expectedAirplanesImageName = "airplanes"
        #expect(expectedAirplanesImageName == SearchSuggestion.airplanes.imageName)
        
        let expectedCarsImageName = "cars"
        #expect(expectedCarsImageName == SearchSuggestion.cars.imageName)
        
        let expectedMotorcyclesImageName = "motorcycles"
        #expect(expectedMotorcyclesImageName == SearchSuggestion.motorcycles.imageName)
    }

}
