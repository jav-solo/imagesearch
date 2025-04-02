//
//  GalleryView.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import SwiftData
import SwiftUI

struct GalleryView: View {
    @Query private var items: [SavedImage]

    var body: some View {
        VStack {
            if !items.isEmpty {
                GeometryReader { geometry in
                    List {
                        ForEach(items) { item in
                            if let uiImage = UIImage(data: item.data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: standardCornerRadius))
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            } else {
                Text("Saved Images will Appear here")
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
        .navigationTitle("Gallery")
    }
}
