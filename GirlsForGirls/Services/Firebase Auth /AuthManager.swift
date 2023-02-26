//
//  AuthManager.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 25.02.2023.
//

import Foundation
import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    
    private var verificationID: String?
    
    func startAuth(phoneNumber: String, completion: @escaping (Bool) -> Void){
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil, completion: { verificationID, error in
            guard let verificationID = verificationID, error == nil else {
                completion(false)
                return
            }
            self.verificationID = verificationID
            completion(true)
        })
    }
    
    public func verifyCode(smsCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationID = verificationID else {
            completion(false)
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: smsCode
        )
        
        Auth.auth().signIn(with: credential, completion: { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            completion(true)
        })
    }
    
}
