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
    
    // MARK: - Properties
    
    @Published var userData: User.Parameters.Retrieve = .init(username: "", password: "")
    
    // MARK: - Init
    
    init(delegate: IAuthDelegate? = nil) {
        self.delegate = delegate
    }
    
    // MARK: - Methods
    
    func submitLogin() {
        delegate?.auth(data: userData)
    }
}
