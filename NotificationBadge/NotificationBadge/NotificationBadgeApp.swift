//
//  NotificationBadgeApp.swift
//  NotificationBadge
//
//  Created by Sitharaj Seenivasan on 20/05/25.
//

import SwiftUI

@main
struct NotificationBadgeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate : NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let center = UNUserNotificationCenter.current()

        
        center.requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
                if let error = error {
                    print("Notification permission error: \(error)")
                } else {
                    print("Badge permission granted: \(granted)")
                }
                
            }
        
        // register the “badgeCategory” for content extension
              let badgeCategory = UNNotificationCategory(
                  identifier: "badgeCategory",
                  actions: [],             // add UNNotificationAction here if needed
                  intentIdentifiers: [],
                  options: []
              )
              center.setNotificationCategories([badgeCategory])
        
        return true
    }
}
