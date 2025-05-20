//
//  NotificationViewController.swift
//  NotificationViewController
//
//  Created by Sitharaj Seenivasan on 20/05/25.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    let suiteName = "group.com.sitharaj.BadgeDemo"
    let badgeKey = "badgeCount"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let defaults = UserDefaults(suiteName: suiteName) else { return }
        // 1. Decrement shared badge count
        var count = defaults.integer(forKey: badgeKey)
        count = max(0, count - 1)
        defaults.set(count, forKey: badgeKey)
        
        // 2. Fire a tiny local notification to update the app icon
        let content = UNMutableNotificationContent()
        content.badge = NSNumber(value: count)
        let req = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        )
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
        
    }
    
}
