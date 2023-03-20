//
//  RegisterRouter.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 19.03.2023.
//

import Foundation

enum RegisterRouter: BaseRouter {
    
    case createUser(data: Data)
    
    var path: String {
        switch self {
        case .createUser:
            return "/api/auth/register/"
        }
    }
    
    var method: String{
        switch self{
        case .createUser:
            return HttpMethod.post.value
        }
    }
    
    var queryParameter: [URLQueryItem]? {
        switch self {
            
        case .createUser:
            return nil
        }
    }
    
    var httpBody: Data? {
        switch self{
        case .createUser(data: let data):
            return data
        }
    }
    
    var httpHeader: [HttpHeader]? {
        switch self{
        case .createUser:
            return nil
        }
    }
}
