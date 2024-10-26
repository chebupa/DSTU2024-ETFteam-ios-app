//
//  SecureStorageService.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import Foundation
import SwiftUI
import Combine
import KeychainAccess
import Dependencies
//import DTOs

// MARK: - Protocol

public protocol ISecureStorageService: ICurrentIAmStorageService {
    
    var isLoggedInPublisher: CurrentValueSubject<Bool, Never> { get set }
    
    var accessToken: Token? { get }
    func setAccess(token: Token?)
//    var refreshToken: Token? { get }
//    func setRefresh(token: Token?)
    
    var deviceId: String? { get }
    func setDevice(id: String?)
}

// MARK: - DependencyValues

public extension DependencyValues {
    
    var secureStorageService: ISecureStorageService {
        get { self[SecureStorageServiceKey.self] }
        set { self[SecureStorageServiceKey.self] = newValue }
    }
    
    enum SecureStorageServiceKey: DependencyKey {
        public static var liveValue: ISecureStorageService = SecureStorageService.standard
    }
}

struct SecureStorageService: ISecureStorageService {
    
    static var standard = SecureStorageService()
    
    private let store: Keychain
    @Dependency(\.currentIAmStorageService) private var currentIAmStorageService
    
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    var isLoggedInPublisher = CurrentValueSubject<Bool, Never>(false)
    
    var iAmStatePublisher: PassthroughSubject<RequesterType?, Never> {
        currentIAmStorageService.iAmStatePublisher
    }
    
    private init() {
        store = Keychain(
            server: "https://etf-team.ru",
            protocolType: .https,
            accessGroup: "teamID.group.etf"
        )
        
        encoder = JSONEncoder()
        decoder = JSONDecoder()
    }
    
    // MARK: - ISecureStorageService
    
    var accessToken: Token? {
        guard let data = store[data: "access_jwt"] else { return nil }
        return try? decoder.decode(Token.self, from: data)
    }
    
    func setAccess(token: Token?) {
        let data = try? encoder.encode(token)
        store[data: "access_jwt"] = data
        if let token = token {
            self.isLoggedInPublisher.send(true)
        } else {
            self.isLoggedInPublisher.send(false)
        }
    }
    
//    var refreshToken: Token? {
//        guard let data = store[data: "refresh_jwt"] else { return nil }
//        return try? decoder.decode(Token.self, from: data)
//    }
//    
//    func setRefresh(token: Token?) {
//        let data = try? encoder.encode(token)
//        store[data: "refresh_jwt"] = data
//        DispatchQueue.main.async {
//            guard let token = self.refreshToken, Date.now < token.expiration else {
//                self.iAmStatePublisher.send(.none)
//                return
//            }
//        }
//    }
    
    var currentIAm: RequesterType? {
        currentIAmStorageService.currentIAm
    }
    
    func setIAm(state: RequesterType?, notify: Bool) {
        currentIAmStorageService.setIAm(state: state, notify: notify)
    }
    
    var deviceId: String? {
        UIDevice.current.identifierForVendor?.uuidString ?? store["device_id"]
    }
    
    func setDevice(id: String?) {
        store["device_id"] = id
    }
}
