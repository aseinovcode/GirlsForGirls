//
//  LoginRouter.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 19.03.2023.
//

import Foundation

enum LoginRouter: BaseRouter {
    
    case login(body: Data)
    case refreshToken(data: Data)
    
    var path: String {
        switch self{
        case .login:
            return "/api/auth/login-phone/"
        case .refreshToken:
            return "/api/auth/refresh/"
        }
    }
    
    var method: String {
        switch self {
        case .login:
            return HttpMethod.post.value
        case .refreshToken:
            return HttpMethod.post.value
        }
    }
    
    var queryParameter: [URLQueryItem]? {
        switch self{
        case .login:
            return nil
        case .refreshToken:
            return nil
        }
    }
    
    var httpBody: Data? {
        switch self{
        case .login(body: let body):
            return body
        case .refreshToken(data: let data):
            return data
        }
    }
    
    var httpHeader: [HttpHeader]?{
        switch self{
        case .login:
            return nil
        case .refreshToken:
            return nil
        }
    }
    
    
    
    
}
