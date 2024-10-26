//
//  EventScreen.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import SwiftUI

struct EventScreen: View {
    
    let event: Event.Responses.Full
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(event.title)
                    .bold()
                    .font(.system(size: 22))
                Spacer()
                Text(event.space)
            }
            Text(event.description)
                .font(.system(size: 14))
                .opacity(0.8)
            ProgressView(value: event.completeProgress.double, total: event.totalProgress.double)
            HStack {
                Text("\(event.completeProgress)")
                Spacer()
                Text("\(event.totalProgress)")
            }
            .font(.system(size: 12))
        }
        .padding()
        .navigationTitle("asd")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EventScreen(event: .init(
        id: 1,
        title: "title",
        description: "desc",
        space: "space",
        completeProgress: 1,
        totalProgress: 5
    ))
}
