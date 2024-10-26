//
//  User.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import Foundation

/// Пространство имен `User` содержит типы данных для взаимодействия с информацией о салонах красоты.
///
/// Включает параметры для запросов (`Parameters`) и модели ответов (`Responses`),
/// используемые для обработки данных о салонах в системе.
public enum User {
    public enum Parameters {}
    public enum Responses {}
}

// MARK: - Parameters -

public extension User.Parameters {
    
    struct Create: Codable {
        
        var email: String
        var password: String
        var fullName: String
    }
    
    struct Retrieve: Codable {
        
        var username: String
        var password: String
    }
}

// MARK: - Responses -

public extension User.Responses {
    
    struct Full: Codable, Identifiable, Hashable, Equatable {
        
        public var id: Int
        
        var fullName: String
        var email: String
    }
}
