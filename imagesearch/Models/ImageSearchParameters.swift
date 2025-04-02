//
//  ImageSearchParameters.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/2/25.
//

typealias ImagePage = Int

struct ImageSearchParameters {
    var sort: ImageSort?
    var window: ImageWindow?
    var page: ImagePage?
    var mediaType: MediaType
    var query: String
    
    init(sort: ImageSort? = nil,
         window: ImageWindow? = nil,
         page: ImagePage? = nil,
         mediaType: MediaType = .jpeg,
         query: String) {
        self.window = window
        self.sort = sort
        self.page = page
        self.mediaType = mediaType
        self.query = query
    }
    
    /// Constructs the specific query for Imgur
    ///
    /// `baseURL/{{sort}}/{{window}}/{{page}}?q={{query}}`
    ///
    var imgurQuery: String {
        var result = ""
        
        if let sort {
            result += "sort=\(sort)/"
        }
        
        if let window {
            result += "window=\(window)/"
        }
        
        if let page {
            result += "page=\(page)"
        }
        
        return result + "?q_any=\(query.lowercased())"
    }
    
    internal var mediaTypeQuery: String {
        switch mediaType {
        case .jpg:
            return "&q_type=jpg"
        case .png:
            return "&q_type=png"
        default:
            return "&q_type=jpeg"
        }

    }
}
