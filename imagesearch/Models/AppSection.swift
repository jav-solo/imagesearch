//
//  AppSection.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/4/25.
//

enum AppSection: Int, Hashable {
    case search, gallery
    
    var title: String {
        switch self {
        case .search:
            "Search"
        case .gallery:
            "Gallery"
        }
    }
    
    var imageName: String {
        switch self {
        case .search:
            "magnifyingglass"
        case .gallery:
            "photo.on.rectangle.angled"
        }
    }
}
