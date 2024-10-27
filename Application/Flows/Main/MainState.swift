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
    
    init() {
        authService.isLoggedInPublisher
            .sink { value in
                self.loggedIn = value
            }
            .store(in: &bag)
//        secureStorageService.isLoggedInPublisher
//            .sink { isLoggedIn in
//                self.loggedIn = isLoggedIn
//                print("IS LOGGED IN")
//            }
//            .store(in: &bag)
    }
}

// MARK: - Methods

extension MainState {
    
    func onActive() {}
}
