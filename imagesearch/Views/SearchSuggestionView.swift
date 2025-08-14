//
//  SearchSuggestionView.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/4/25.
//

import SwiftUI

struct SearchSuggestionView: View {
    let columnWidthRatio = 0.45
    let rowHeightRatio = 0.3
    
    @Binding var query: String
    @Binding var presentSearch: Bool
    
    let numberOfRows: Int = (SearchSuggestion.allCases.count + 2 - 1) / 2
    let numberOfColumns: Int = 2
    let suggestions: [SearchSuggestion] = SearchSuggestion.allCases
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                Grid(horizontalSpacing: standardPadding, verticalSpacing: standardPadding) {
                    ForEach(0..<numberOfRows, id: \.self) { row in
                        GridRow {
                            ForEach(0..<numberOfColumns, id: \.self) { int in
                                let index = row * numberOfColumns + int
                                if index >= suggestions.count {
                                    EmptyView()
                                } else {
                                    ZStack {
                                        Image(suggestions[index].imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: geometry.size.width * columnWidthRatio, height: geometry.size.height * rowHeightRatio)
                                            .clipShape(RoundedRectangle(cornerRadius: standardCornerRadius))
                                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: standardCornerRadius))
                                        VStack(alignment: .leading) {
                                            Spacer()
                                            HStack {
                                                Text(suggestions[index].title)
                                                    .font(.title3)
                                                    .fontWeight(.bold)
                                                Spacer()
                                            }
                                            .padding(.leading, standardPadding)
                                        }
                                        .padding(.bottom, standardPadding)
                                    }
                                    .onTapGesture {
                                        query = suggestions[index].title
                                        presentSearch = true
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.top, standardPadding)
        }
    }
}

#Preview {
    SearchSuggestionView(query: Binding<String>.constant(""), presentSearch: Binding<Bool>.constant(false))
}
