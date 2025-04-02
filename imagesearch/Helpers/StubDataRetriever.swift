//
//  StubDataRetriever.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import Foundation

struct StubDataRetriever: DataRetriever {
    var response: MockImageData.Response
    
    init(response: MockImageData.Response = .good) {
        self.response = response
    }
    
    func data(for request: URLRequest, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        let bundle = Bundle(for: SystemInfo.self)
        let mockData = MockImageData(response: self.response)
        return try mockData.data(bundle: bundle)
    }
}
