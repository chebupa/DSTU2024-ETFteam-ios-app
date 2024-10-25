//
//  EventsScreen.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import SwiftUI

// MARK: - Screen

struct EventsScreen: View {
    
    // MARK: - Properties
    
    @StateObject var state: EventsState
    
    // MARK: - Body
    
    var body: some View {
        Text("Events screen")
    }
}

// MARK: - Preview

#Preview {
    EventsScreen(state: EventsState())
}
