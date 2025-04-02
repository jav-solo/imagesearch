//
//  URLCache+imagesearch.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/4/25.
//

import Foundation

extension URLCache {
    static let imageCache = URLCache(memoryCapacity: 128_000_000, diskCapacity: 2_000_000_000)
}
