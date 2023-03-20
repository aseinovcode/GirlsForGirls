//
//  StatusCode.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 17.03.2023.
//

import Foundation

enum StatusCode{
    case ok
    case created
    case badRequest
    case unauthorized
    
    var code: Int {
        switch self{
        case .ok:
            return 200
        case .created:
            return 201
        case .badRequest:
            return 400
        case .unauthorized:
            return 401
        }
    }
}
