//
//  Event.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import Foundation

enum Event {
    enum Parameters {}
    enum Responses {}
}

extension Event.Parameters {
    
    struct Create: Codable {
    }
    
    struct Retrive: Codable {}
}

extension Event.Responses {
    
    struct Full: Codable, Identifiable {
        
        var id: Int
        
        var title: String
        var description: String
        var space: String
        
        var completeProgress: Int
        var totalProgress: Int
    }
}
