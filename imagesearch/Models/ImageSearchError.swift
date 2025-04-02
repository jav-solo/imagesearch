//
//  ImageSearchError.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/3/25.
//

import Foundation

enum ImageSearchError: Error {
    case networkIssue, noResults
    
    var customerDescription: String {
        switch self {
        case .networkIssue:
            return "There was a network issue. Please try again later."
        case .noResults:
            return "No Results Found"
        }
    }
}
