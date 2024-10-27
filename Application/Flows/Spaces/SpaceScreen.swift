//
//  SpaceScreen.swift
//  ios-app
//
//  Created by aristarh on 27.10.2024.
//

import SwiftUI
import Dependencies

struct SpaceScreen: View {
    
    let space: Space.Responses.Full
    
    @State private var createEventSheetIsShown: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Описание")
                .bold()
                .font(.system(size: 24))
            Text(space.description)
                .padding(.bottom)
            
            Text("Токен-приглашение")
                .bold()
                .font(.system(size: 24))
            Text(space.invitationToken)
                .padding(.bottom)
            
            Text("Достижения")
                .bold()
                .font(.system(size: 24))
            HStack {
                if space.achievements.count > 0 {
                    ForEach(space.achievements) { ach in
                        Text(ach.name)
                    }
                } else {
                    Text("Пока нет достижений")
                }
            }
            .padding(.bottom)
            
            Text("Испытания")
                .bold()
                .font(.system(size: 24))
            TabView {
                ForEach(1..<8) { _ in
//                    Text("Испытание 1")
                    EventWidget(event: .init(id: 1, title: "Испытание 1", description: "описание", space: "asd", completeProgress: 1, totalProgress: 2))
                }
            }
            .tabViewStyle(.page)
            .frame(height: 120, alignment: .top)
            .background(.accent)
            .clipShape(.rect(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .navigationTitle(space.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Редактировать") {}
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Button("Создать испытание") { createEventSheetIsShown = true }
            }
        }
        .sheet(isPresented: $createEventSheetIsShown) {
//            CreateEventScreen(spaceID: space.id)
        }
    }
}

#Preview {
    SpaceScreen(space: .init(id: 1, name: "asdsa", description: "dopas[d", invitationToken: "saodk", achievements: [.init(spaceID: 1, name: "pnfo")]))
}
