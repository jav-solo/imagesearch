//
//  ContentView.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/1/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var items: [SavedImage]
    @State var tabSelection: AppSection = .search
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationStack {
                GalleryView()
            }
            .tabItem {
                Label {
                    Text(AppSection.gallery.title)
                } icon: {
                    Image(systemName: AppSection.gallery.imageName)
                }
            }
            .tag(AppSection.gallery)
            
            NavigationStack {
                ImageSearchView()
            }
            .tabItem {
                Label {
                    Text(AppSection.search.title)
                } icon: {
                    Image(systemName: AppSection.search.imageName)
                }
                .labelStyle(.iconOnly)
            }
            .tag(AppSection.search)
        }
        .tabViewStyle(.sidebarAdaptable)
        .onAppear {
            if !items.isEmpty {
                self.tabSelection = .gallery
            }
        }
        
    }
}
