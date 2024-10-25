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
        Text("Spaces screen")
    }
}

// MARK: - Preview

#Preview {
    SpacesScreen(state: SpacesState())
}
