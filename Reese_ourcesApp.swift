//
//  Reese_ourcesApp.swift
//  Reese-ources
//
//  Created by Jessi on 6/7/23.
//

import SwiftUI

@main
struct Reese_ourcesApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
