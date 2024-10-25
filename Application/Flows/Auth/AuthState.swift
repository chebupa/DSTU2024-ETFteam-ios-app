//
//  AuthState.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import SwiftUI

enum AuthType {
    case login
    case register
}

protocol IAuthDelegate: AnyObject {
    func changeAuthType(to authType: AuthType)
}

// MARK: - State

final class AuthState: ObservableObject {
    
    // MARK: - Screen
    
    var screen: AuthScreen { AuthScreen(state: self) }
    
    // MARK: - SubScreens
    
    lazy var loginState = LoginState(delegate: self)
    lazy var registrationState = RegistrationState(delegate: self)
    
    // MARK: - Navigation
    
    @Published var choosedAuthType: AuthType = .login
    
    // MARK: - Init
    
    init() {}
}

// MARK: - IAuthDelegate

extension AuthState: IAuthDelegate {
    
    func changeAuthType(to authType: AuthType) {
        withAnimation(.smooth) {
            choosedAuthType = authType
        }
    }
}
