//
//  NotificationService.swift
//  NotificationService
//
//  Created by Sitharaj Seenivasan on 20/05/25.
//

import UserNotifications

import UserNotifications

class NotificationService: UNNotificationServiceExtension {
    let suiteName = "group.com.sitharaj.BadgeDemo"
    let badgeKey = "badgeCount"
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        
        guard
          let best = (request.content.mutableCopy() as? UNMutableNotificationContent),
          let defaults = UserDefaults(suiteName: suiteName)
        else {
            contentHandler(request.content)
            return
        }

        // 1. Increment shared badge count
        var count = defaults.integer(forKey: badgeKey)
        count += 1
        defaults.set(count, forKey: badgeKey)

        // 2. Apply to delivered notification
        best.badge = NSNumber(value: count)
        contentHandler(best)
        
    }


    override func serviceExtensionTimeWillExpire() {
        // fallback: deliver original content
    }
}
