//
//  AuthService.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import Foundation
import Dependencies
import KeychainAccess

// MARK: - Protocol

public protocol IAuthService {
    
    func auth() async throws -> User.Responses.Full
    
    func logout() async throws
}

// MARK: - Dependency Values

public extension DependencyValues {
    
    var authService: any IAuthService {
        get { self[AuthServiceKey.self] }
        set { self[AuthServiceKey.self] = newValue }
    }
    
    enum AuthServiceKey: DependencyKey {
        public static let liveValue: IAuthService = AuthService()
    }
}

// MARK: - Live

struct AuthService: IAuthService {
    
    // MARK: - Dependencies
    
    @Dependency(\.requestsService) var requestsService
    @Dependency(\.coderService) var coderService
    @Dependency(\.secureStorageService) var secureStorageService
    
    // MARK: - Methods
    
    func auth() async throws -> User.Responses.Full {
        
        let response = try await requestsService.request(
            path: "",
            method: .post,
//            parameters: nil,
            requestType: .session
        )
            .serializingDecodable(Auth.Responses.Full.self, decoder: coderService.decoder)
            .value
        return response.user
    }
    
    func logout() async throws {
        //
    }
}
