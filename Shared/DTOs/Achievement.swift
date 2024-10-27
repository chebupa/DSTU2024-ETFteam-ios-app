//
//  Achievement.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import Foundation

public enum Achievement {
    public enum Parameters {}
    public enum Responses {}
}

public extension Achievement.Parameters {}

public extension Achievement.Responses {
    
    struct Full: Codable, Identifiable {
        
        public var id: Int { spaceID }
        
        var spaceID: Int
        var name: String
    }
}
