//
//  SearchSuggestion.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/4/25.
//

import Foundation

enum SearchSuggestion: String, CaseIterable {
    case cats, dogs, rome, paris, sanFrancisco, newYork, airplanes, cars, motorcycles
    
    var title: String {
        switch self {
        case .cats:
            "Cats"
        case .dogs:
            "Dogs"
        case .rome:
            "Rome"
        case .paris:
            "Paris"
        case .sanFrancisco:
            "San Francisco"
        case .newYork:
            "New York"
        case .airplanes:
            "Airplanes"
        case .cars:
            "Cars"
        case .motorcycles:
            "Motorcycles"
        }
    }
    
    var imageName: String {
        switch self {
        case .cats:
            "cats"
        case .dogs:
            "dogs"
        case .rome:
            "rome"
        case .paris:
            "paris"
        case .sanFrancisco:
            "san-francisco"
        case .newYork:
            "new-york"
        case .airplanes:
            "airplanes"
        case .cars:
            "cars"
        case .motorcycles:
            "motorcycles"
        }
    }
}
