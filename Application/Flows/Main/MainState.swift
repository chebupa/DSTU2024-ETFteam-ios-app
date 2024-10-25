//
//  MainState.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import Foundation
import Dependencies
import SwiftUINavigation

// MARK: - State

final class MainState: ObservableObject {
    
    // MARK: - Screen
    
    var screen: MainScreen { MainScreen(state: self) }
    
    // MARK: - SubScreens
    
    lazy var authState = AuthState()
    lazy var eventsState = EventsState()
    lazy var spacesState = SpacesState()
    lazy var profileState = ProfileState()
    
    let tabScreens: [any Tabbable] = [EventsState(), SpacesState(), ProfileState()]
    
    // MARK: - Properties
    
    @Published var launched: Bool = false
    @Published var loggedIn: Bool = true
    
    // MARK: - Navigation
    
    @CasePathable
    enum Destination {
        case register
        case login
    }
    
    @Published var destination: Destination?
    
    // MARK: - Services
    
//    @Dependency(\.date) var date
//    @Dependency(\.secureStorageService) var storageService
//    @Dependency(\.secureStorageService) var storageService
    
    // MARK: - Init
    
    init() {}
}

// MARK: - Methods

extension MainState {
    
    func onActive() {}
}
