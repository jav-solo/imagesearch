//
//  ErrorView.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/3/25.
//

import SwiftUI

struct ErrorView: View {
    let maxWidth = 600.0
    let error: ImageSearchError
    
    var body: some View {
        VStack {
            Text(error.customerDescription)
                .frame(maxWidth: maxWidth)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    ErrorView(error: .networkIssue)
}
