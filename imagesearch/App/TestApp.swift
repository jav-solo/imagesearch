//
//  TestApp.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/5/25.
//

import SwiftUI

struct TestApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Running Unit Tests")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ProgressView()
            }
        }
    }
}
