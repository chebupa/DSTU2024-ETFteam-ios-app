//
//  SpacesService.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import Foundation
import Dependencies

// MARK: - Protocol

public protocol ISpacesService {
    
    func getSpaces() async throws -> [Space.Responses.Full]
    
    func create(space: Space.Parameters.Create) async throws
    
    func joinSpace(by token: String) async throws
    
    func create(event: Event.Parameters.Create, for spaceID: Int) async throws
    
    func getAllEvents() async throws -> [Event.Responses.Full]
}

// MARK: - Dependency Values

public extension DependencyValues {
    
    var spacesService: any ISpacesService {
        get { self[SpacesServiceKey.self] }
        set { self[SpacesServiceKey.self] = newValue }
    }
    
    enum SpacesServiceKey: DependencyKey {
        public static let liveValue: ISpacesService = SpacesService()
    }
}

// MARK: - Live

struct SpacesService: ISpacesService {
    
    @Dependency(\.requestsService) private var requestsService
    @Dependency(\.coderService) private var coderService
    
    // MARK: - Spaces
    
    func getSpaces() async throws -> [Space.Responses.Full] {
        let response = try await requestsService
            .request(path: "/spaces", method: .get, requestType: .session)
            .serializingDecodable([Space.Responses.Full].self, decoder: coderService.decoder)
            .value
        return response
    }
    
    func create(space: Space.Parameters.Create) async throws {
        _ = try await requestsService
            .request(path: "/spaces", method: .post, parameters: space, requestType: .session)
            .serializingDecodable(Space.Responses.Full.self, decoder: coderService.decoder)
            .value
    }
    
    func joinSpace(by token: String) async throws {
        _ = try await requestsService
            .request(path: "/spaces/join-by-token", method: .post, parameters: token, requestType: .session)
    }
    
    // MARK: - Events
    
    func create(event: Event.Parameters.Create, for spaceID: Int) async throws {
        _ = try await requestsService
            .request(path: "/spaces/\(spaceID)", method: .post, parameters: event, requestType: .session)
    }
    
    func getAllEvents() async throws -> [Event.Responses.Full] {
        let respoonse = try await requestsService
            .request(path: "/spaces/*/challenges", method: .get, requestType: .session)
            .serializingDecodable([Event.Responses.Full].self, decoder: coderService.decoder)
            .value
        return respoonse
    }
}
