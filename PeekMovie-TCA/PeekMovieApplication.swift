//
//  PeekMovie_TCAApp.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import SwiftUI

@main
struct PeekMovieApplication: App {
    
    @UIApplicationDelegateAdaptor(ApplicationDelegate.self) private var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ApplicationView(store: appDelegate.store)
        }
    }
}
