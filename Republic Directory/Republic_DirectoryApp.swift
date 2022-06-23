//
//  Republic_DirectoryApp.swift
//  Republic Directory
//
//  Created by Patrick Mayo  on 6/20/22.
//

import SwiftUI

@main
struct Republic_DirectoryApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
