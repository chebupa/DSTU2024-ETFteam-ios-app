//
//  EventScreen.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import SwiftUI

struct EventScreen: View {
    
    let event: Event.Responses.Full
    
//    @State private var createEventSheetIsShown: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(event.name)
                    .bold()
                    .font(.system(size: 22))
                Spacer()
                Text("\(event.spaceId)")
            }
            Text(event.description)
                .font(.system(size: 14))
                .opacity(0.8)
            ProgressView(value: event.currentProgress.double)
        }
        .padding()
        .navigationTitle("asd")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
//    EventScreen(event: .init(
//        id: 1,
//        title: "title",
//        description: "desc",
//        space: "space",
//        completeProgress: 1,
//        totalProgress: 5
//    ))
}
