//
//  MockData.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import Foundation
import OSLog

enum MockDataError: Error {
    case couldNotReadFile
}

class MockImageData {
    enum Response {
        case good, empty, bad, veryBad
        
        var fileName: String {
            switch self {
            case .good:
                return "good_result"
            case .empty:
                return "empty_result"
            case .bad:
                return "bad_result"
            case .veryBad:
                return "very_bad_result"
            }
        }
    }
    
    let response: Response
    
    init(response: Response) {
        self.response = response
    }
    
    func data(bundle: Bundle) throws -> (Data, URLResponse) {
        guard let path = bundle.path(forResource: response.fileName, ofType: "json") else {
            Logger.testing.error("Could not get json data for \(self.response.fileName) in bundle: \(bundle)")
            throw MockDataError.couldNotReadFile
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let url = URL(fileURLWithPath: path)
        let statusCode = self.response != .bad ? 200 : 400
        let response = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)! as URLResponse
        return (data ?? Data(), response)
    }
}
