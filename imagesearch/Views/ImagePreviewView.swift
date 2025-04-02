//
//  ImagePreviewView.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/3/25.
//

import SwiftUI

struct ImagePreviewView: View {
    let image: SearchImage
    
    var body: some View {
        CachedAsyncImage(url: image.link, urlCache: .imageCache) { image in
            image
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: standardCornerRadius))
        } placeholder: {
            Image(systemName: "photo")
        }
        .padding()
    }
}
