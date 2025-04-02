//
//  ImageLoader.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/2/25.
//

import Foundation
import OSLog

struct ImageLoader: ImageLoaderProtocol {
    static func loadImages(source: ImageSourceEndpoint = .imgurGallerySearch,
                          params: ImageSearchParameters,
                           auth: HTTPAuthorization = ImgurAuthorization()) async throws -> [SearchImage] {
        var urlString = source.rawValue
        urlString += params.imgurQuery
        
        guard let url = URL(string: urlString) else {
            fatalError("Could not create URL from \(urlString)")
        }
        
        Logger.imageLoader.debug("Loading images with : \(urlString)")
        var request = URLRequest(url: url)
        request.httpMethod = "\(HTTPMethod.get)"
        request.setValue(auth.value, forHTTPHeaderField: auth.fieldKey)
        let (data, response) = try await Current.dataRetriever.data(for: request, delegate: nil)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let purlResponse = response as? HTTPURLResponse, purlResponse.statusCode == 200 else {
            Logger.imageLoader.error("Got response: \(String(describing: response))")
            throw ImageSearchError.networkIssue
        }
        
        let result = try decoder.decode(SearchImageResult.self, from: data)
        if result.data.isEmpty {
            throw ImageSearchError.noResults
        }
        
        let imageResults: [SearchImage] = result.data.reduce([]) { partialResult, post in
            if let images = post.images, post.nsfw == false {
                return partialResult + images.filter { !$0.animated }
            } else {
                return partialResult
            }
        }
        
        return imageResults
    }
}
