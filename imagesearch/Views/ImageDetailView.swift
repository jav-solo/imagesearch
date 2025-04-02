//
//  ImageDetailView.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/3/25.
//

import OSLog
import SwiftData
import SwiftUI

struct ImageDetailView: View {
    let maxWidth = 700.0
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [SavedImage]
    
    let cache: URLCache = .imageCache
    let image: SearchImage
    
    var body: some View {
        VStack {
            if let title = image.title {
                Text(title)
                    .font(.title)
                    .padding(.horizontal, standardPadding)
            }
            Spacer()
            
            CachedAsyncImage(url: image.link, urlCache: cache) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: maxWidth)
                    .clipShape(RoundedRectangle(cornerRadius: standardPadding))
                    .onTapGesture(count: 2) {
                        if !itemsContain(self.image.link) {
                            saveImage()
                        }
                    }
            } placeholder: {
                Image(systemName: "photo")
            }
            
            if let description = image.description {
                Text(description)
                    .padding(.horizontal, standardPadding)
            }
            
            Spacer()
            
            if itemsContain(image.link) {
                Button {
                    Logger.userInteraction.error("Deleting image: \(image.link.absoluteString) from disk")
                    deleteItems(url: image.link)
                } label: {
                    Image(systemName: "trash")
                }
                .clipShape(Circle())
                .buttonStyle(.bordered)
                .foregroundStyle(.red)
            } else {
                Button {
                    saveImage()
                } label: {
                    Image(systemName: "square.and.arrow.down")
                }
                .clipShape(Circle())
                .buttonStyle(.bordered)
            }
            Spacer()
        }
    }
    
    private func saveImage() {
        guard let data = cachedData(for: self.image.link, cache: cache) else {
            Logger.userInteraction.error("Could not save image: \(self.image.link.absoluteString) to disk")
            return
        }
        
        withAnimation {
            let newItem = SavedImage(data: data, url: self.image.link)
            modelContext.insert(newItem)
        }
        try? modelContext.save()
    }

    private func deleteItems(url: URL) {
        withAnimation {
            if let index = items.firstIndex(where: { $0.url == url }) {
                modelContext.delete(items[index])
                try? modelContext.save()
            }
        }
    }
    
    private func itemsContain(_ url: URL) -> Bool {
        items.contains { $0.url == url }
    }
    
    public func cachedData(for url: URL, cache: URLCache = .shared) -> Data? {
        let urlRequest = URLRequest(url: url)
        guard let data = cache.cachedResponse(for: urlRequest)?.data else {
            Logger.imageLoader.error("Could not retrieve cached data to save")
            return nil
        }
        return data
    }
}
