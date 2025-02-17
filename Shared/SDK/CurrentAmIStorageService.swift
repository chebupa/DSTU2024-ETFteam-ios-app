//
//  CurrentAmIStorageService.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import Foundation
import Dependencies
import Combine
//import DTOs

public protocol ICurrentIAmStorageService {
    
    var iAmStatePublisher: PassthroughSubject<RequesterType?, Never> { get }
    var currentIAm: RequesterType? { get }
    func setIAm(state: RequesterType?, notify: Bool)
}

public extension DependencyValues {
    
    var currentIAmStorageService: ICurrentIAmStorageService {
        get { self[CurrentIAmStorageServiceKey.self] }
        set { self[CurrentIAmStorageServiceKey.self] = newValue }
    }
    
    enum CurrentIAmStorageServiceKey: DependencyKey {
        public static var liveValue: ICurrentIAmStorageService = CurrentIAmStorageService()
    }
}

struct CurrentIAmStorageService: ICurrentIAmStorageService {
    
    let iAmStatePublisher = PassthroughSubject<RequesterType?, Never>()
    private let userDefaults = UserDefaults(suiteName: "group.etf")
    
    // MARK: - Init
    
    init() {}
    
    // MARK: - ICurrentIAmStorageService
    
    var currentIAm: RequesterType? {
        guard let rawValue = userDefaults?.string(forKey: "iam_state") else { return .none }
        return RequesterType(rawValue: rawValue)
    }
    
    func setIAm(state: RequesterType?, notify: Bool) {
        userDefaults?.set(state?.rawValue, forKey: "iam_state")
        if notify {
            DispatchQueue.main.async {
                self.iAmStatePublisher.send(state)
            }
        }
    }
}
