//
//  LoginService.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 19.03.2023.
//

import Foundation

protocol LoginServiceProtocol2 {
    func sendPhoneNumber(phone: String, password: String)
}

class LoginService: LoginServiceProtocol2{

    private let networkService = NetworkService()
    private let userDefaults = UserDefaultsService()
    
    func sendPhoneNumber(phone: String, password: String) {
        let data = LoginModel(phone_number: phone.lowercased(), password: password).toData()
        networkService.sendRequest(urlRequest: LoginRouter.login(body: data).createURLRequest(), successModel: TokenServiceModel.self) {
            [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.userDefaults.save(value: model.access, key: .token)
                print(model)
            case .badRequest(let bad):
                print(bad)
            case .unauthorized(let needToken):
                print(needToken)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getData(number: String) -> Data {
        struct LoginModel: Codable {
            let phone: String?
        }
        let object = LoginModel(phone: number)
        return object.toData()
    }
}

fileprivate extension Encodable {
    func toData() -> Data {
        (try? JSONEncoder().encode(self)) ?? Data()
    }
}

