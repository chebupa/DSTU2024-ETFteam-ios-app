//
//  AuthenticatorService.swift
//  ios-app
//
//  Created by aristarh on 25.10.2024.
//

import Foundation
import Alamofire
import Dependencies

struct JWTCredential: AuthenticationCredential {
    
    var token: Token?
    
    var requiresRefresh: Bool { false }
//    var requiresRefresh: Bool {
//        guard token?.value != nil, let expiration = token?.expiration else { return false }
//        
//        return expiration <= Date.now
//    }
}

final class JWTAuthenticator: Authenticator {
    
    // MARK: - Dependencies
    
    @Dependency(\.requestsService) var requestsService
    @Dependency(\.coderService) var coderService
    @Dependency(\.secureStorageService) var secureStorageService
//    @Dependency(\.loggerService) var loggerService
    
    // MARK: - Authenticator
    
    func apply(_ credential: JWTCredential, to urlRequest: inout URLRequest) {
        //loggerService.log(.debug, "Apply with:\(credential)")
        guard let token = credential.token else { return }
        urlRequest.headers.add(.authorization(bearerToken: token.accessToken))
    }
    
    func refresh(_ credential: JWTCredential, for session: Session, completion: @escaping (Result<JWTCredential, Error>) -> Void) {
        requestsService
            .request(path: "/token", method: .post, requestType: .session)
            .responseDecodable(of: Token.self, decoder: coderService.decoder) { response in
                switch response.result {
                case .success(let value):
                    //self.loggerService.log(.pulse, .debug, "Refresh succes respone:\(value) with:\(credential)")
                    self.secureStorageService.setAccess(token: value)
//                    if let refreshToken = value.refreshToken {
//                        self.secureStorageService.setRefresh(token: refreshToken)
//                    }
                    let credential = JWTCredential(token: self.secureStorageService.accessToken)
                    completion(.success(credential))
                case .failure(let error):
                    //self.loggerService.log(.debug, "Refresh failure respone:\(error) with:\(credential)")
//                    self.secureStorageService.setRefresh(token: nil)
                    self.secureStorageService.setAccess(token: nil)
                    completion(.failure(error))
                }
            }
    }
    
    func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        //loggerService.log(.debug, "Did Request error:\(error) for:\(String(describing: response.url?.absoluteString))")
        switch error.asAFError {
        case .requestRetryFailed(let retryError, _):
            return retryError.asAFError?.responseCode == 401
        case .responseValidationFailed(let reason):
            switch reason {
            case .unacceptableStatusCode(let code):
                return code == 401
            default:
                return false
            }
        default:
            return false
        }
    }
    
    func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: JWTCredential) -> Bool {
        //loggerService.log(.debug, "Is Request url:\(String(describing: urlRequest.url?.absoluteString)) compare with:\(credential)")
        guard let token = credential.token else { return true }
        return urlRequest.headers.contains(.authorization(bearerToken: token.accessToken))
    }
}
