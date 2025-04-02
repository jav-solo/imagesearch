//
//  DataRetriever.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import Foundation

protocol DataRetriever {
    func data(for request: URLRequest,
              delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}


extension URLSession: DataRetriever {}
