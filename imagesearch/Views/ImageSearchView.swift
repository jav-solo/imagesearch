//
//  ImageResultsView.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/3/25.
//

import OSLog
import SwiftUI

struct ImageSearchView: View {
    @Environment(\.dismissSearch) var dismissSearch
    @Environment(\.isSearching) var isSearching
    
    @State var presentSearch = false
    @State var query: String = ""
    
    let viewModel = ImageSearchViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .onAppear {
                        Logger.userInteraction.debug("Showing progress view")
                    }
            case .loaded(let images):
                if images.isEmpty {
                    SearchSuggestionView(query: $query, presentSearch: $presentSearch)
                        .onAppear {
                            Logger.userInteraction.debug("Showing suggestion view")
                        }
                } else {
                    listView(for: images)
                }
            case .error(let error):
                ErrorView(error: error)
                    .onAppear {
                        Logger.userInteraction.debug("Showing error view")
                    }
            }
            Spacer()
        }
        .navigationTitle("Search")
        .padding()
        .searchable(text: $query,
                    isPresented: $presentSearch,
                    placement: .navigationBarDrawer,
                    prompt: "People, Places, Things, and More")
        .searchSuggestions {
            if viewModel.recents.first != query { // This is to prevent the suggestions from blocking the list on *first* search
                ForEach(viewModel.recents, id: \.self) { recent in
                    Text(recent)
                        .searchCompletion(recent)
                        .padding(.horizontal, standardPadding)
                }
            }
        }
        .onSubmit(of: .search) {
            Logger.userInteraction.debug("User searching for: \(query)")
            Task {
                await viewModel.loadImages(for: query)
            }
            viewModel.save(search: query)
        }
        .onChange(of: query) {
            if query.isEmpty {
                Logger.userInteraction.debug("Clearing results")
                viewModel.clearResults()
            }
        }
    }
    
    func listView(for images: [SearchImage]) -> some View {
        List {
            ForEach(images) { image in
                NavigationLink {
                    ImageDetailView(image: image, images: images)
                } label: {
                    ImagePreviewView(image: image)
                }
                .frame(alignment: .center)
            }
        }
        .onAppear {
            Logger.userInteraction.debug("Showing list view")
        }
    }
}
