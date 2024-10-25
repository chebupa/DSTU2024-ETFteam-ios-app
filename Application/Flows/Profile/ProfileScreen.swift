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
        Text("Profile screen")
    }
}

// MARK: - Preview

#Preview {
    ProfileScreen(state: ProfileState())
}
