//
//  RecentsView.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/4/25.
//

import SwiftUI

struct RecentsView: View {
    @Binding var recents: [String]
    
    var userDidSelect: ((String) -> Void)
    
    var body: some View {
        List {
            ForEach(recents, id: \.self) { recent in
                Button {
                    userDidSelect(recent)
                } label: {
                    Text(recent)
                }

            }
        }
    }
}
