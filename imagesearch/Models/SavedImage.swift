//
//  SavedImage.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/1/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class SavedImage {
    var data: Data
    var timestamp: Date
    var url: URL
    
    init(data: Data, url: URL) {
        self.data = data
        self.timestamp = Date()
        self.url = url
    }
}
