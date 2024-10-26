//
//  EventsScreen.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - Screen

struct EventsScreen: View {
    
    // MARK: - Properties
    
    @StateObject var state: EventsState
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical) {
            switch state.state {
            case .loading:
                Text("loading")
            case .loaded(let events):
                makeLoadedView(events: events)
            case .error(let error):
                Text(error.localizedDescription)
            }
        }
        .padding()
        .searchable(text: $state.searchText, prompt: "Search events")
        .toolbar {
            ToolbarItem {
//                Button("", systemImage: "calendar") {
//                    state.destination = .openCalendarSheet
//                }
            }
        }
//        .sheet(item: $state.destination.openCalendarSheet) { _ in
//            DatePicker(
//                "picker",
//                selection: .constant(Date()),
//                displayedComponents: .date
//            )
//            .datePickerStyle(.wheel)
//        }
        .navigationDestination(item: $state.destination.openEvent) { event in
            EventScreen(event: event)
        }
    }
}

// MARK: - Subviews

extension EventsScreen {
    
    @ViewBuilder
    func makeLoadedView(events: [Event.Responses.Full]) -> some View {
        ForEach(events) { event in
            VStack(alignment: .leading) {
                HStack {
                    Text(event.title)
                        .bold()
                        .font(.system(size: 22))
                    Spacer()
                    Text(event.space)
                }
                Text(event.description)
                    .font(.system(size: 14))
                    .opacity(0.8)
                ProgressView(value: event.completeProgress.double, total: event.totalProgress.double)
                HStack {
                    Text("\(event.completeProgress)")
                    Spacer()
                    Text("\(event.totalProgress)")
                }
                .font(.system(size: 12))
            }
            .padding()
            .background(Color(uiColor: .systemGray6).opacity(0.8))
            .clipShape(.rect(cornerRadius: 10))
            .onTapGesture { state.destination = .openEvent(event) }
        }
    }
}

// MARK: - Preview

#Preview {
    MainScreen(state: MainState())
//    EventsScreen(state: EventsState())
}
