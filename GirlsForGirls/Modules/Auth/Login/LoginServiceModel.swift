//
//  LoginServiceModel.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 19.03.2023.
//

import Foundation

struct LoginModel: Codable {
    let phone_number : String?
    let password : String?

    enum CodingKeys: String, CodingKey {

        case phone_number = "phone_number"
        case password = "password"
    }
}

struct TokenServiceModel: Codable {
    
    let refresh: String?
    let access: String?

    enum CodingKeys: String, CodingKey {

        case refresh = "refresh"
        case access = "access"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        refresh = try values.decodeIfPresent(String.self, forKey: .refresh)
        access = try values.decodeIfPresent(String.self, forKey: .access)
    }
}
