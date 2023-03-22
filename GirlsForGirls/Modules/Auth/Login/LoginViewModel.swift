//
//  LoginViewModel.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 25.02.2023.
//

import Foundation
import FirebaseAuth

protocol LoginServiceProtocol {
    func sendPhoneNumber(phone: String, password: String)
    var isTextFieldValid: Bool { get set }
    var isUserAuthorize: ((Bool) -> ())? { get set }
}

class LoginViewModel: LoginServiceProtocol {
    
    private let networkService = NetworkService()
    private let userDefaults = UserDefaultsService()
    
    var isTextFieldValid: Bool = true
    
    var successText: String = ""
     
    var isUserAuthorize: ((Bool) -> Void)?
    
    func sendPhoneNumber(phone: String, password: String){
        AuthManager.shared.startAuth(phoneNumber: phone) { [weak self] success in
            guard success else { return }
            self?.successText = "Success"
        }
        let newPhoneNumber = "996" + phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        let data = LoginModel(phone_number: newPhoneNumber, password: password).toData()
        self.networkService.sendRequest(urlRequest: LoginRouter.login(body: data).createURLRequest(), successModel: TokenServiceModel.self) {
            [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.userDefaults.save(value: model.access, key: .token)
                self.userDefaults.save(value: model.refresh, key: .refresh)
                self.isUserAuthorize?(true)
                self.isTextFieldValid = true
                print(model)
            case .badRequest(let bad):
                self.isTextFieldValid = false
                print(bad)
            case .unauthorized(let needToken):
                print(needToken)
                self.isTextFieldValid = false
            case .failure(let error):
                print(error)
                self.isTextFieldValid = false
            }
        }
    }
    
    func makeRoot(viewController: UIViewController) {
        if let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            delegate.makeRoot(viewController: viewController)
        }
    }
}

fileprivate extension Encodable {
    func toData() -> Data {
        (try? JSONEncoder().encode(self)) ?? Data()
    }
}
