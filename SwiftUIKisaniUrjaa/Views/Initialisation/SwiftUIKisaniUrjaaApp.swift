//
//  SwiftUIKisaniUrjaaApp.swift
//  SwiftUIKisaniUrjaa
//
//  Created by Raghav Kakria on 02/02/26.
//

import SwiftUI

@main
struct SwiftUIKisaniUrjaaApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            RootViewSelector()
                .environmentObject(appState)
        }
    }
}
