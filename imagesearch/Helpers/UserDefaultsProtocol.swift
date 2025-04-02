//
//  UserDefaultsProtocol.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import Foundation

protocol UserDefaultsProtocol {
    func dictionary(forKey defaultName: String) -> [String : Any]?
    func set(_ value: Any?, forKey defaultName: String)
}

extension UserDefaults: UserDefaultsProtocol {}
