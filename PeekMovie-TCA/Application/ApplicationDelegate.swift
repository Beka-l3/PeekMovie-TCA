//
//  ApplicationDelegate.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import UIKit
import ComposableArchitecture

// MARK: - AppDelegate

public final class ApplicationDelegate: NSObject, UIApplicationDelegate {
    
    
    public private(set) lazy var store: StoreOf<Application> = Store(
        initialState: .setupDuringSplash(),
        reducer: Application.init
    )
    
    // MARK: Exposed methods

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil ) -> Bool {
//        firebase.configure()
        store.send(.delegate(.didFinishLaunching))
        return true
    }

    public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return true
//        if googleAuth.handleUrl(url) {
//            return true
//        } else {
//            return false
//        }
    }

    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        store.send(.delegate(.didRegisterForRemoteNotifications(deviceToken: deviceToken)))
    }

    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error ) {
//        store.send(.delegate(.didFailToRegisterForRemoteNotifications(error: error)))
    }

    public func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
//        store.send(.delegate(.didReceiveMemoryWarning))
    }


}

