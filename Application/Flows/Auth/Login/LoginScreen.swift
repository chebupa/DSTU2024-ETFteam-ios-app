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
            TextField("E-mail", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            TextField("Пароль", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            Button("Войти") {}
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
