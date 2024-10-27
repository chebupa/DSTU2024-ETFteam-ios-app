//
//  Space.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import Foundation

public enum Space {
    public enum Parameters {}
    public enum Responses {}
}

public extension Space.Parameters {
    
    struct Create: Codable {
        
        var name: String
        var description: String
    }
}

public extension Space.Responses {
    
    struct Full: Codable, Identifiable {
        
        public var id: Int
        
        var name: String
        var description: String
        var invitationToken: String
        var achievements: [Achievement.Responses.Full]
    }
}
