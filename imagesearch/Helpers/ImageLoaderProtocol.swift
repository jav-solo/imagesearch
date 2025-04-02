//
//  ImageLoaderProtocol.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

protocol ImageLoaderProtocol {
    static func loadImages(source: ImageSourceEndpoint,
                          
                    params: ImageSearchParameters,
                          
                    auth: HTTPAuthorization) async throws -> [SearchImage]
}
