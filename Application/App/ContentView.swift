//
//  ContentView.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - Screen

struct ContentView: View {
    
    // MARK: - Properties
    
    @StateObject var state = MainState()
    
    // MARK: - Body
    
    var body: some View {
        state.screen
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
