//
//  EventWidget.swift
//  ios-app
//
//  Created by aristarh on 27.10.2024.
//

import SwiftUI

struct EventWidget: View {
    
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
                .colorInvert()
            HStack {
                Text("\(event.completeProgress)")
                Spacer()
                Text("\(event.totalProgress)")
            }
            .font(.system(size: 12))
        }
        .padding()
//        .navigationTitle("asd")
//        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EventWidget()
//}
