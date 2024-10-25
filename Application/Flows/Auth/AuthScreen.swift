//
//  AuthScreen.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import SwiftUI

// MARK: - Screen

struct AuthScreen: View {
    
    // MARK: - Properties
    
    @StateObject var state: AuthState
    
    // MARK: - Body
    
    var body: some View {
        switch state.choosedAuthType {
        case .login:
            state.loginState.screen
        case .register:
            state.registrationState.screen
        }
    }
}

// MARK: - Preview

#Preview {
    AuthScreen(state: AuthState())
}
