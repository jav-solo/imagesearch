//
//  ImageSearchViewModel.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/3/25.
//

import Observation
import OSLog

@Observable
class ImageSearchViewModel {
    enum State: Equatable {
        case loading
        case loaded(images: [SearchImage])
        case error(error: ImageSearchError)
        
        static func == (lhs: State, rhs: State) -> Bool {
            switch (lhs, rhs) {
            case (.loading, .loading):
                return true
            case (.loaded, .loaded):
                return true
            case (.error, .error):
                return true
            default:
                return false
            }
        }
    }
    
    var state: State = .loaded(images: [])
    
    private var savedSearches = SavedSearch()
    var recents: [String] {
        return savedSearches.sortedResults
    }
    
    func loadImages(for query: String) async {
        state = .loading
        do {
            let params = ImageSearchParameters(query: query)
            let images = try await ImageLoader.loadImages(params: params)
            Logger.imageLoader.debug("Loaded \(images.count) images")
            state = .loaded(images: images)
        } catch let error as ImageSearchError {
            Logger.imageLoader.error("Image loader returned error: \(error.localizedDescription)")
            state = .error(error: error)
        } catch {
            state = .error(error: .networkIssue)
        }
    }
    
    func clearResults() {
        state = .loaded(images: [])
    }
    
    func save(search query: String) {
        self.savedSearches.insert(query: query)
    }
}
