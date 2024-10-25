//
//  LoginState.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import Foundation

// MARK: - State

final class LoginState: ObservableObject {
    
    weak var delegate: IAuthDelegate?
    
    // MARK: - Screen
    
    var screen: LoginScreen { LoginScreen(state: self) }
    
    // MARK: - Init
    
    init(delegate: IAuthDelegate? = nil) {
        self.delegate = delegate
    }
}

// MARK: - Methods

extension LoginState {
    
    func submit() {}
}
