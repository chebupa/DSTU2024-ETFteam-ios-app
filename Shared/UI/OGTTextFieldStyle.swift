//
//  OGTTextFieldStyle.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import SwiftUI

struct OGTTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .font(.custom("American Typewriter", size: 24))
            .background(Color.red)
            .border(Color.purple)
            .cornerRadius(8)
    }
}
