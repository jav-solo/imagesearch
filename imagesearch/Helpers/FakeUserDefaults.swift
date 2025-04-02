//
//  FakeUserDefaults.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import Foundation

class FakeUserDefaults: UserDefaultsProtocol {
    var dictionary: [String: Any] = [:]
    
    func dictionary(forKey defaultName: String) -> [String : Any]? {
        return dictionary as [String : Any]
    }
    
    func set(_ value: Any?, forKey defaultName: String) {
        dictionary[defaultName] = value
    }
}
