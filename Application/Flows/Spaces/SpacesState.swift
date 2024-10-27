//
//  SpacesState.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI
import Dependencies
import CasePaths

// MARK: - State

final class SpacesState: ObservableObject, Tabbable {
    
    // MARK: - Tabbable
    
    let tabTitle: String = "Spaces"
    let tabImage: String = "person.3"
    
    // MARK: - Screen
    
    var screen: AnyView { AnyView(SpacesScreen(state: self)) }
    
    // MARK: - Properties
    
    @Published var createSpaceSheetIsOpen: Bool = false
    
    // MARK: - State
    
    enum State {
        case loading
        case loaded([Space.Responses.Full])
        case error(Error)
    }
    
    @Published var state: State = .loading
    
    // MARK: - Destination
    
    @CasePathable
    enum Destination {
        case openSpace(Space.Responses.Full)
    }
    
    @Published var destination: Destination?
    
    // MARK: - Services
    
    @Dependency(\.spacesService) private var spacesService
    
    // MARK: - Init
    
    init() {}
    
    // MARK: - Methods
    
    func onAppear() {
        Task { @MainActor in
            do {
                let events = try await spacesService.getSpaces()
                state = .loaded(events)
            } catch {
                state = .error(error)
            }
            
        }
    }
    
//    func create(space: Space.Parameters.Create) {
//        Task { @MainActor in
//            do {
//                try await spacesService.create(space: space)
//            } catch {
//                //
//            }
//        }
//    }
}

public extension String {
    
    var id: String { self }
}
