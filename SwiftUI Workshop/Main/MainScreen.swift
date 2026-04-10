//
//  MainScreen.swift
//  SwiftUI Workshop
//
//  Created by Mac on 09/04/26.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            MessagesScreen()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
        }
    }
}
