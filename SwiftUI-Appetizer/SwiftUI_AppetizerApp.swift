//
//  SwiftUI_AppetizerApp.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 27/06/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_AppetizerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            AppetizerTabView()
        }
        .modelContainer(sharedModelContainer)
    }
}
