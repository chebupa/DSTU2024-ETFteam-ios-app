//
//  SpacesState.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - State

final class SpacesState: ObservableObject, Tabbable {
    
    // MARK: - Tabbable
    
    let tabTitle: String = "Spaces"
    let tabImage: String = "person.3"
    
    // MARK: - Screen
    
    var screen: AnyView { AnyView(SpacesScreen(state: self)) }
    
    // MARK: - Init
    
    init() {}
}
