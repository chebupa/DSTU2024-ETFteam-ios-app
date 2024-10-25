//
//  RegistrationScreen.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - Screen

struct RegistrationScreen: View {
    
    // MARK: - Properties
    
    @StateObject var state: RegistrationState
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Image("oggetto-logo_tonal-hor-eng_tonal-hor-eng")
                .resizable()
                .frame(width: 250, height: 86)
            TextField("E-mail", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            TextField("Имя", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            TextField("Пароль", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            Button("Зарегистрироваться") {}
                .buttonStyle(OGTButtonStyle())
            Button("Уже есть аккаунт? Войти") {
                state.delegate?.changeAuthType(to: .login)
            }
            .foregroundStyle(.gray)
            .padding(8)
        }
        .padding()
    }
}

// MARK: - Preview

#Preview {
    RegistrationScreen(state: RegistrationState())
}
