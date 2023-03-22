//
//  ChangePassword.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 22.03.2023.
//

import Foundation

enum ChangePassword: BaseRouter {
    
    case password(body: Data)
    
    var path: String  {
        switch self {
        case .password:
            return "/api/auth/change-password/"
        }
    }
    
    var method: String{
        switch self{
        case .password:
            return HttpMethod.post.value
        }
    }
    
    var queryParameter: [URLQueryItem]?{
        switch self {
        case .password:
            return nil
        }
    }
    
    var httpBody: Data?{
        switch self{
        case .password(body: let body):
            return body
        }
    }
    
    var httpHeader: [HttpHeader]?{
        switch self{
        case .password:
            return nil
        }
    }
}
