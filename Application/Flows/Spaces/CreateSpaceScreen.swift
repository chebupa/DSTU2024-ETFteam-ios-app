//
//  CreateSpaceScreen.swift
//  ios-app
//
//  Created by aristarh on 27.10.2024.
//

import SwiftUI
import Dependencies

struct CreateSpaceScreen: View {
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var alertIsPresented: Bool = false
    
    @Dependency(\.spacesService) private var spacesService
    
    var body: some View {
        VStack {
            TextField("Название", text: $name)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.none)
            TextField("Описание", text: $description)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.none)
            Button("Создать") {
//                create(space: .init(name: name, description: description))
            }
            .buttonStyle(OGTButtonStyle())
        }
        .padding()
    }
}

#Preview {
    CreateSpaceScreen()
}
