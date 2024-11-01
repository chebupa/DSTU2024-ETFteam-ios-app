//
//  MainScreen.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - Screen

struct MainScreen: View {
    
    // MARK: - Properties
    
    @StateObject var state: MainState
    
    // MARK: - Body
    
    var body: some View {
        Group {
            if true {
                if state.loggedIn {
                    TabView {
                        ForEach(state.tabScreens, id: \.id) { tabScreen in
                            NavigationStack {
                                tabScreen.screen
                                    .navigationTitle(tabScreen.tabTitle)
                            }
                            .tabItem { Label(tabScreen.tabTitle, systemImage: tabScreen.tabImage) }
                        }
                    }
                } else {
                    state.authState.screen
                        .onAppear {
                            if let token = UserDefaults().string(forKey: "token") {
                                state.loggedIn = true
                            }
                        }
                        .onReceive(state.secureStorageService.isLoggedInPublisher) { value in
                            withAnimation(.smooth) {
                                state.loggedIn = value
                            }
                        }
                }
            } else {
                LaunchScreen(launched: $state.launched)
            }
        }
        .onReceive(state.authService.isLoggedInPublisher) { value in
            state.loggedIn = value
        }
    }
}

// MARK: - Preview

#Preview {
    MainScreen(state: MainState())
}
