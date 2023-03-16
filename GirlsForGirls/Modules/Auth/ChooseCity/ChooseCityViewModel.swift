//
//  ChooseCityViewModel.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 25.02.2023.
//

import Foundation

class ChooseCityViewModel {
    
    var successText: String = ""
    
    func sendPhoneData(phoneNumber: String){
        let phone = "+996 \(phoneNumber)"
        AuthManager.shared.startAuth(phoneNumber: phone) { [weak self] success in
            guard success else { return }
            self?.successText = "Success"
        }
    }
}
