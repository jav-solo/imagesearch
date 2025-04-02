//
//  MediaType.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/4/25.
//

struct MediaType: OptionSet {
    let rawValue: Int
    
    static let jpg = MediaType(rawValue: 1 << 0)
    static let jpeg = MediaType(rawValue: 1 << 1)
    static let png = MediaType(rawValue: 1 << 2)
    
    static let all: MediaType = [.jpg, .jpeg, .png]
}
