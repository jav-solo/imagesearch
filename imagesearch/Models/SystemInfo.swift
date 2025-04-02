//
//  SystemInfo.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import Foundation

var Current = SystemInfo.currentEnvironment()

class SystemInfo {
    var userDefaults: UserDefaultsProtocol
    var imageLoader: ImageLoaderProtocol
    var dataRetriever: DataRetriever
    
    init(userDefaults: UserDefaultsProtocol,
         imageLoader: ImageLoaderProtocol,
         dataRetriever: DataRetriever) {
        self.userDefaults = userDefaults
        self.imageLoader = imageLoader
        self.dataRetriever = dataRetriever
    }
    
    static func currentEnvironment() -> SystemInfo {
        if NSClassFromString("XCTest") != nil {
            return SystemInfo.test
        } else {
            return SystemInfo.prod
        }
    }
    
    static let prod: SystemInfo = {
        let userDefaults = UserDefaults.standard
        let imageLoader = ImageLoader()
        return SystemInfo(userDefaults: userDefaults,
                          imageLoader: imageLoader,
                          dataRetriever: URLSession.shared)
    }()
    
    
    static let test: SystemInfo = {
        let userDefaults = FakeUserDefaults()
        let imageLoader = ImageLoader()
        let bundle = Bundle(for: SystemInfo.self)
        let dataRetriever = StubDataRetriever()
        
        return SystemInfo(userDefaults: userDefaults, imageLoader: imageLoader, dataRetriever: dataRetriever)
    }()
}
