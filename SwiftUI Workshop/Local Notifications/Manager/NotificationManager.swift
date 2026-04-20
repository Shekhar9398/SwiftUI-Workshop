//
//  NotificationManager.swift
//  SwiftUI Workshop
//
//  Created by Mac on 20/04/26.
//

import Foundation
import UserNotifications

final class NotificationManager {
    
    static let shared = NotificationManager()
    private init() {}
    
    func scheduleLocalNotification(
        id: String = UUID().uuidString,
        title: String,
        body: String,
        date: Date
    ) {
        guard date > Date() else {
            print("NotificationManager: Cannot schedule notification in the past")
            return
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        let components = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute],
            from: date
        )
        
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: components,
            repeats: false
        )
        
        let request = UNNotificationRequest(
            identifier: id,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("NotificationManager: Notification scheduling failed:", error.localizedDescription)
            }
        }
    }
    
    func cancelLocalNotification(id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
}
