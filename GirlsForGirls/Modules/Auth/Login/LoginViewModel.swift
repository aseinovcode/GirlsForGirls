//
//  LoginViewModel.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 25.02.2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel {
    
    private let phone: String = "(550) 908-907"
    private let userPassword: String = "password"
     
    var isUserAuthorize: ((Bool) -> Void)?
    
    var successText: String = ""
    
    func sendPhoneData(phoneNumber: String){
        let phone = "+996 \(phoneNumber)"
        AuthManager.shared.startAuth(phoneNumber: phone) { [weak self] success in
            guard success else { return }
            self?.successText = "Success"
        }
    }
    
    func authorize(phone: String, password: String){
        if phone.lowercased() == phone.lowercased() && userPassword == password{
            isUserAuthorize!(true)
        }
        else{
            isUserAuthorize!(false)
        }
    }
    
    func makeRoot(viewController: UIViewController) {
        if let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            delegate.makeRoot(viewController: viewController)
        }
    }
    
}
