//
//  ProfileScreen.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - Screen

struct ProfileScreen: View {
    
    // MARK: - Properties
    
    @StateObject var state: ProfileState
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 200, height: 200)
                .padding(.top)
            Text("Имя")
                .font(.system(size: 32))
                .bold()
            Text("example@mail.ru")
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Выйти из аккаунта") { state.logout() }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ProfileScreen(state: ProfileState())
//    MainScreen(state: MainState())
}
