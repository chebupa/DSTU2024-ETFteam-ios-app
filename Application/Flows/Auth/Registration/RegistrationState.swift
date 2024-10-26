//
//  RegistrationState.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import Foundation

// MARK: - State

final class RegistrationState: ObservableObject {
    
    weak var delegate: IAuthDelegate?
    
    // MARK: - Screen
    
    var screen: RegistrationScreen { RegistrationScreen(state: self) }
    
    // MARK: - Properties
    
    @Published var userData: User.Parameters.Create = .init(email: "", password: "", fullName: "")
    
    // MARK: - Init
    
    init(delegate: IAuthDelegate? = nil) {
        self.delegate = delegate
    }
    
    // MARK: - Methods
    
    func submitRegistration() {
        delegate?.register(data: userData)
    }
}
