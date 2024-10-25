//
//  ProfileState.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - State

final class ProfileState: ObservableObject, Tabbable {
    
    // MARK: - Tabbable
    
    let tabTitle: String = "Profile"
    let tabImage: String = "person"
    
    // MARK: - Screen
    
    var screen: AnyView { AnyView(ProfileScreen(state: self)) }
    
    // MARK: - Init
    
    init() {}
}
