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
    @Dependency(\.secureStorageService) private var secureStorageService
    
    // MARK: - Init
    
    init() {
        secureStorageService.isLoggedInPublisher
            .sink { isLoggedIn in
                self.loggedIn = isLoggedIn
            }
            .store(in: &bag)
    }
}

// MARK: - Methods

extension MainState {
    
    func onActive() {}
}
