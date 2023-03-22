//
//  FailureModel.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 17.03.2023.
//

import Foundation

struct FailureModel: Codable {
    var detail: String?

    enum CodingKeys: String, CodingKey {
        case detail
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        detail = try? values.decodeIfPresent(String.self, forKey: .detail)
    }
}
