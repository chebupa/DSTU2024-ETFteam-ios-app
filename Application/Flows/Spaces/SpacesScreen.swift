//
//  SpacesScreen.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - Screen

struct SpacesScreen: View {
    
    // MARK: - Properties
    
    @StateObject var state: SpacesState
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            switch state.state {
            case .loading:
                Text("loading")
            case .loaded(let spaces):
                ForEach(spaces) { space in
                    
//                    var name: String
//                    var description: String
//                    var invitationToken: String
//                    var achievements: [Achievement.Responses.Full]
                    
                    VStack(alignment: .leading) {
                        Text(space.name)
                            .bold()
                            .font(.system(size: 24))
                        Text(space.description)
                        HStack {
                            ForEach(space.achievements) { ach in
                                Text(ach.name)
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(uiColor: .systemGray6).opacity(0.8))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)
                    .onTapGesture { state.destination = .openSpace(space) }
                }
            case .error(let error):
                Text(error.localizedDescription)
            }
        }
        .refreshable { state.onAppear() }
        .onAppear { state.onAppear() }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button("Создать пространство") { state.createSpaceSheetIsOpen = true }
                Button("Присоединиться") {}
            }
        }
        .sheet(isPresented: $state.createSpaceSheetIsOpen) {
            CreateSpaceScreen()
        }
        .navigationDestination(item: $state.destination.openSpace) { space in
            SpaceScreen(space: space)
        }
    }
}

// MARK: - Preview

#Preview {
    SpacesScreen(state: SpacesState())
}
