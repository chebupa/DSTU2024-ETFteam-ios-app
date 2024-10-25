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
    
    // MARK: - Init
    
    init(delegate: IAuthDelegate? = nil) {
        self.delegate = delegate
    }
}
