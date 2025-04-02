//
//  SavedSearch.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import Foundation

class SavedSearch {
    let MAX_NUM_RECENT_SEARCHES: Int = 10
    
    private let userDefaultsKey = "savedSearches"
    private let defaults: UserDefaultsProtocol
    private var recents: [String: Date]
    
    var sortedResults: [String] {
        return Array(recents.keys).sorted { recents[$0]! > recents[$1]! }
    }
    
    init() {
        self.defaults = Current.userDefaults
        if let defaultsData = defaults.dictionary(forKey: userDefaultsKey), let recents = defaultsData as? [String: Date] {
            self.recents = recents
        } else {
            self.recents = [:]
        }
    }
    
    func insert(query: String) {
        self.recents[query] = Date()
        sortAndSave()
    }
    
    func sortAndSave() {
        var sortedRecents: [String: Date] = [:]
        var sortedArray = recents.sorted { $0.value > $1.value }
        if sortedArray.count > MAX_NUM_RECENT_SEARCHES {
            sortedArray = Array(sortedArray.dropLast())
        }
        sortedRecents = Dictionary(uniqueKeysWithValues: sortedArray)
        self.recents = sortedRecents
        defaults.set(sortedRecents, forKey: userDefaultsKey)
    }
}
