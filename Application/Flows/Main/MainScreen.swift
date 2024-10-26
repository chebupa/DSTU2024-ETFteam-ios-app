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
        if true {
//            if true {
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
            }
        } else {
            LaunchScreen(launched: $state.launched)
        }
    }
}

// MARK: - Preview

#Preview {
    MainScreen(state: MainState())
}
