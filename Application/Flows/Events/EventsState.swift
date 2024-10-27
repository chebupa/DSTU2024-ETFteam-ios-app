//
//  EventsState.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI
import Combine
import CasePaths
import Dependencies

// MARK: - State

final class EventsState: ObservableObject, Tabbable {
    
    // MARK: - Tabbable
    
    let tabTitle: String = "Events"
    let tabImage: String = "house"
    
    // MARK: - Screen
    
    var screen: AnyView { AnyView(EventsScreen(state: self)) }
    
    // MARK: - Properties
    
    @Published var events: [Event.Responses.Full] = []
    @Published var searchText: String = ""
    
    private var bag = Set<AnyCancellable>()
    
    // MARK: - State
    
    enum State {
        case loading
        case loaded([Event.Responses.Full])
        case error(Error)
    }
    
//    @Published var state: State = .loaded([
//        .init(id: 0, title: "title1", description: "desc1", space: "space1", completeProgress: 25, totalProgress: 100),
//        .init(id: 1, title: "title2", description: "desc2", space: "space2", completeProgress: 75, totalProgress: 100),
//        .init(id: 2, title: "title3", description: "desc3", space: "space3", completeProgress: 300, totalProgress: 1000),
//        .init(id: 3, title: "title4", description: "desc4", space: "space4", completeProgress: 1, totalProgress: 10),
//        .init(id: 4, title: "title5", description: "desc5", space: "space5", completeProgress: 5, totalProgress: 30),
//        .init(id: 5, title: "title6", description: "desc6", space: "space6", completeProgress: 12, totalProgress: 125),
//        .init(id: 6, title: "title7", description: "desc7", space: "space7", completeProgress: 45, totalProgress: 1234),
//        .init(id: 7, title: "title8", description: "desc8", space: "space8", completeProgress: 1239, totalProgress: 5000)
//    ])
    
    @Published var state: State = .loading
    
    // MARK: - Navigations
    
    @CasePathable
    enum Destination {
        case openEvent(Event.Responses.Full)
        case openCalendarSheet(String = "openCalendarSheet")
    }
    
    @Published var destination: Destination?
    
    // MARK: - Services
    
    @Dependency(\.spacesService) private var spacesService
    
    // MARK: - Init
    
    init() {
        $searchText
            .debounce(for: 1, scheduler: RunLoop.main)
            .sink { value in
//                withAnimation(.smooth) {
//                    self.state = .loading
//                }
            }
            .store(in: &bag)
    }
    
    // MARK: - Methods
    
    func onAppear() {
        Task { @MainActor in
            do {
                let events = try await spacesService.getAllEvents()
                state = .loaded(events)
            } catch {
                state = .error(error)
            }
        }
    }
}
