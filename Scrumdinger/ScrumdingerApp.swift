//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Zach Cervi on 8/23/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
