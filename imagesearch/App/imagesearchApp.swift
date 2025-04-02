//
//  imagesearchApp.swift
//  imagesearch
//
//  Created by Javier Solorzano on 4/1/25.
//

import SwiftUI
import SwiftData

struct imagesearchApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SavedImage.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
