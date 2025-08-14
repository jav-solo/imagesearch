//
//  SearchImageResult.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/2/25.
//

import SwiftUI

struct SearchImageResult: Decodable {
    var data: [ImagePost]
}

struct ImagePost: Decodable, Identifiable {
    var id: String
    var nsfw: Bool?
    var isAd: Bool
    var images: [SearchImage]?
}

struct SearchImage: Decodable, Identifiable, Equatable {
    var id: String
    var title: String?
    var description: String?
    var datetime: Int
    var animated: Bool
    var type: String
    var link: URL
}
