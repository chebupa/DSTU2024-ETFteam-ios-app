//
//  OGTButtonStyle.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import SwiftUI

struct OGTButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.accent)
            .clipShape(.rect(cornerRadius: 10))
    }
}
