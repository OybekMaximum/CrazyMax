//
//  CrazyMaxApp.swift
//  CrazyMax
//
//  Created by Oybek To’laboyev on 28/09/21.
//

import SwiftUI

@main
struct CrazyMaxApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
