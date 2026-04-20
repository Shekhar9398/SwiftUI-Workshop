//
//  NotificationSchedulerView.swift
//  SwiftUI Workshop
//
//  Created by Mac on 20/04/26.
//

import SwiftUI
import UserNotifications

struct NotificationSchedulerView: View {
    
    @State private var isNotificationEnabled = false
    @State private var selectedDate = Date()
    @State private var notificationID: String?
    
    @State private var showAlert = false
    @State private var upcomingDate: Date?
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Toggle
            Toggle("Enable Notifications", isOn: $isNotificationEnabled)
                .onChange(of: isNotificationEnabled) {
                    handleToggle(isNotificationEnabled)
                }
                .padding()
            
            // Wheel Style Date Picker (cleaner)
            DatePicker(
                "Select Date & Time",
                selection: $selectedDate,
                in: Date()...,
                displayedComponents: [.date, .hourAndMinute]
            )
            .datePickerStyle(.wheel)
            .labelsHidden()
            .padding()
            
            // Schedule Button
            Button("Schedule Notification") {
                schedule()
            }
            .disabled(!isNotificationEnabled)
            .buttonStyle(.borderedProminent)
            
            // Upcoming Notification Section
            if let upcomingDate {
                VStack(spacing: 8) {
                    Text("Upcoming Notification")
                        .font(.headline)
                    
                    Text(formatDate(upcomingDate))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top)
            }
            
            Spacer()
        }
        .navigationTitle("Notifications")
        .alert("Notification Scheduled", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            if let upcomingDate {
                Text(formatDate(upcomingDate))
            }
        }
    }
    
    // MARK: - Actions
    
    private func handleToggle(_ isOn: Bool) {
        if isOn {
            requestPermission()
        } else {
            if let id = notificationID {
                NotificationManager.shared.cancelLocalNotification(id: id)
            }
            upcomingDate = nil
        }
    }
    
    private func schedule() {
        let id = UUID().uuidString
        notificationID = id
        
        NotificationManager.shared.scheduleLocalNotification(
            id: id,
            title: "Reminder",
            body: "Your scheduled notification",
            date: selectedDate
        )
        
        upcomingDate = selectedDate
        showAlert = true
    }
    
    private func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            if !granted {
                DispatchQueue.main.async {
                    isNotificationEnabled = false
                }
            }
        }
    }
    
    // MARK: - Helpers
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    NotificationSchedulerView()
}
