//
//  MainScreen.swift
//  SwiftUI Workshop
//
//  Created by Mac on 09/04/26.
//

import SwiftUI

struct MainScreen: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack(alignment: .bottom) {

            // MARK: - Content
            Group {
                switch selectedTab {
                case .home:
                    HomeScreen()
                case .chat:
                    MessagesScreen()
                case .question:
                    ClinicalQuestionScreen()
                case .notifications:
                    NotificationSchedulerView()
                }
            }

            // MARK: - Custom TabBar
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

// MARK: - Tab Enum
enum Tab {
    case home
    case chat
    case question
    case notifications

    var icon: String {
        switch self {
        case .home: return "house"
        case .chat: return "message"
        case .question: return "book"
        case .notifications: return "bell"
        }
    }

    var selectedIcon: String {
        icon + ".fill"
    }

    var title: String {
        switch self {
        case .home: return "Home"
        case .chat: return "Chat"
        case .question: return "Q"
        case .notifications: return "Alerts"
        }
    }
}

// MARK: - Custom TabBar
struct CustomTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            tabItem(.home)
            tabItem(.chat)
            tabItem(.question)
            tabItem(.notifications)
        }
        .padding()
        .background(
            LinearGradient(
                colors: [.white, .mint],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(edges: .bottom)
        )
    }

    private func tabItem(_ tab: Tab) -> some View {
        let isSelected = selectedTab == tab

        return Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedTab = tab
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: isSelected ? tab.selectedIcon : tab.icon)
                    .font(.system(size: 20, weight: .semibold))

                Text(tab.title)
                    .font(.caption)
            }
            .foregroundStyle(isSelected ? Color.black : Color.gray)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    MainScreen()
}
