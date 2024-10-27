//
//  AuthState.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import SwiftUI
import Dependencies

enum AuthType {
    
    case login
    case register
}

protocol IAuthDelegate: AnyObject {
    
    func changeAuthType(to authType: AuthType)
    
    func register(data: User.Parameters.Create)
    
    func auth(data: User.Parameters.Retrieve)
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
    
    // MARK: - Services
    
    @Dependency(\.authService) private var authService
    
    // MARK: - Init
    
    init() {}
}

// MARK: - IAuthDelegate

extension AuthState: IAuthDelegate {
    
    func register(data: User.Parameters.Create) {
        Task {
            _ = try await authService.register(user: data)
            _ = try await authService.auth(user: .init(password: data.password, username: data.email))
        }
    }
    
    func auth(data: User.Parameters.Retrieve) {
        Task {
            try await authService.auth(user: data)
        }
    }
    
    func changeAuthType(to authType: AuthType) {
        withAnimation(.smooth) {
            choosedAuthType = authType
        }
    }
}
