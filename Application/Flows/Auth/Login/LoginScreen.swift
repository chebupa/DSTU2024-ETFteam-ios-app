//
//  LoginScreen.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - Screen

struct LoginScreen: View {
    
    // MARK: - Properties
    
    @StateObject var state: LoginState
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Image("oggetto-logo_tonal-hor-eng_tonal-hor-eng")
                .resizable()
                .frame(width: 250, height: 86)
            TextField("E-mail", text: $state.userData.username)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.none)
            TextField("Пароль", text: $state.userData.password)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.none)
            Button("Войти") { state.submitLogin() }
                .buttonStyle(OGTButtonStyle())
            Button("Нет аккаунта? Зарегистрироваться") {
                state.delegate?.changeAuthType(to: .register)
            }
            .foregroundStyle(.gray)
            .padding(8)
        }
        .padding()
    }
}

// MARK: - Preview

#Preview {
    LoginScreen(state: LoginState())
}
