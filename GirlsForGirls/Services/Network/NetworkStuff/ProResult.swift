//
//  ProResult.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 17.03.2023.
//

import Foundation

enum ProResult<Success> {
    case success(Success)
    case badRequest(FailureModel)
    case unauthorized(String)
    case failure(String)
}
