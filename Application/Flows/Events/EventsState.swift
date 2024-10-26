//
//  EventsState.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - State

final class EventsState: ObservableObject, Tabbable {
    
    // MARK: - Tabbable
    
    let tabTitle: String = "Events"
    let tabImage: String = "house"
    
    // MARK: - Screen
    
    var screen: AnyView { AnyView(EventsScreen(state: self)) }
    
    // MARK: - State
    
    
    
    // MARK: - Init
    
    init() {}
}
