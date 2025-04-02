//
//  ImageSearchParametersTests.swift
//  imagesearchTests
//
//  Created by Javier Solorzano on 4/5/25.
//

import Testing
@testable import imagesearch
struct ImageSearchParametersTests {

    @Test func testImageQuery() async throws {
        let standaloneQuery = ImageSearchParameters(query: "foo")
        let expectedStandaloneQueryString = "?q_any=foo"
        #expect(standaloneQuery.imgurQuery == expectedStandaloneQueryString)
        
        let sortTimeQuery = ImageSearchParameters(sort: .time, query: "foo")
        let expectedsortTimeQueryString = "sort=time/?q_any=foo"
        #expect(sortTimeQuery.imgurQuery == expectedsortTimeQueryString)
        
        let sortViralQuery = ImageSearchParameters(sort: .viral, query: "foo")
        let expectedsortViralQueryString = "sort=viral/?q_any=foo"
        #expect(sortViralQuery.imgurQuery == expectedsortViralQueryString)
        
        let sortTopQuery = ImageSearchParameters(sort: .top, query: "foo")
        let expectedsortTopQueryString = "sort=top/?q_any=foo"
        #expect(sortTopQuery.imgurQuery == expectedsortTopQueryString)
        
        let windowDayQuery = ImageSearchParameters(window: .day, query: "foo")
        let expectedWindowDayQueryString = "window=day/?q_any=foo"
        #expect(windowDayQuery.imgurQuery == expectedWindowDayQueryString)
        
        let windowWeekQuery = ImageSearchParameters(window: .week, query: "foo")
        let expectedWindowWeekQueryString = "window=week/?q_any=foo"
        #expect(windowWeekQuery.imgurQuery == expectedWindowWeekQueryString)
        
        let windowMonthQuery = ImageSearchParameters(window: .month, query: "foo")
        let expectedWindowMonthQueryString = "window=month/?q_any=foo"
        #expect(windowMonthQuery.imgurQuery == expectedWindowMonthQueryString)
        
        let windowYearQuery = ImageSearchParameters(window: .year, query: "foo")
        let expectedWindowYearQueryString = "window=year/?q_any=foo"
        #expect(windowYearQuery.imgurQuery == expectedWindowYearQueryString)
        
        let windowAllQuery = ImageSearchParameters(window: .all, query: "foo")
        let expectedWindowAllQueryString = "window=all/?q_any=foo"
        #expect(windowAllQuery.imgurQuery == expectedWindowAllQueryString)
        
        let pageOneQuery = ImageSearchParameters(page: 1, query: "foo")
        let expectedPageOneQueryString = "page=1?q_any=foo"
        #expect(pageOneQuery.imgurQuery == expectedPageOneQueryString)
        
        let fullQuery = ImageSearchParameters(sort: .top, window: .day, page: 1, query: "foo")
        let expectedFullQueryString = "sort=top/window=day/page=1?q_any=foo"
        #expect(fullQuery.imgurQuery == expectedFullQueryString)
    }
    
    @Test func testMediaTypeQuery() {
        let jpgQuery = ImageSearchParameters(mediaType: .jpg, query: "foo")
        let expectedJPGQuery = "&q_type=jpg"
        #expect(jpgQuery.mediaTypeQuery == expectedJPGQuery)
        
        let pngQuery = ImageSearchParameters(mediaType: .png, query: "foo")
        let expectedPNGQuery = "&q_type=png"
        #expect(pngQuery.mediaTypeQuery == expectedPNGQuery)
        
        let defaultQuery = ImageSearchParameters(mediaType: .jpeg, query: "foo")
        let expectedDefaultQuery = "&q_type=jpeg"
        #expect(defaultQuery.mediaTypeQuery == expectedDefaultQuery)
        
    }

}
