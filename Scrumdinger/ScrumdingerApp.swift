//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Zach Cervi on 8/23/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
