//
//  MainState.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import Foundation
import Dependencies
import SwiftUINavigation
import Combine

// MARK: - State

@MainActor
final class MainState: ObservableObject {
    
    // MARK: - Screen
    
    var screen: MainScreen { MainScreen(state: self) }
    
    // MARK: - SubScreens
    
    lazy var authState = AuthState()
    
    let tabScreens: [any Tabbable] = [EventsState(), SpacesState(), ProfileState()]
    
    // MARK: - Properties
    
    @Published var launched: Bool = false
    @Published var loggedIn: Bool = false
    
    private var bag = Set<AnyCancellable>()
    
//    @Dependency(\.currentIAmStorageService) var currentIAmStorageService
    @Dependency(\.secureStorageService) var secureStorageService
    @Dependency(\.authService) var authService
    
    // MARK: - Init
    
    init() {}
}

// MARK: - Methods

extension MainState {
    
    func onActive() {}
}
