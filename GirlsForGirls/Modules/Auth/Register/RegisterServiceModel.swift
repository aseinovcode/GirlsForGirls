//
//  RegisterServiceModel.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 19.03.2023.
//

import Foundation

struct RegisterServiceModel : Codable {
    let email : String?
    let phone_number : String?
    let password : String?
    let password2 : String?
    let first_name : String?
    let last_name : String?
    let region : String?
    let district : String?

    enum CodingKeys: String, CodingKey {

        case email = "email"
        case phone_number = "phone_number"
        case password = "password"
        case password2 = "password2"
        case first_name = "first_name"
        case last_name = "last_name"
        case region = "region"
        case district = "district"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        password2 = try values.decodeIfPresent(String.self, forKey: .password2)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        district = try values.decodeIfPresent(String.self, forKey: .district)
    }

}
