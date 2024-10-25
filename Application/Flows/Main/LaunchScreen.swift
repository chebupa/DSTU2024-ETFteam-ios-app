//
//  LaunchScreen.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI
import Dependencies

// MARK: - Screen

struct LaunchScreen: View {
    
    // MARK: - Properties
    
    @Binding var launched: Bool
    
    // MARK: - Dependencies
    
    @Dependency(\.continuousClock) var clock
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.yellow
            Image(systemName: "person")
                .resizable()
                .frame(width: 150, height: 150)
        }
        .ignoresSafeArea()
        .onAppear {
            Task { @MainActor in
                try await clock.sleep(for: .seconds(2))
                withAnimation {
                    launched = true
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    LaunchScreen(launched: .constant(false))
}
