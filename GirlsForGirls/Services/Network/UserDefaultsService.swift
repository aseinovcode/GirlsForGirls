//
//  UserDefaultsService.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 17.03.2023.
//

import Foundation

class UserDefaultsService{
    
    static let shared = UserDefaultsService()
    
    private let storage: UserDefaults
    
    required init(storage: UserDefaults = UserDefaults.standard) {
        self.storage = storage
    }
    
    enum Keys: String {
        case token
        case refresh
    }
    
    func getBy(key: Keys) -> Any? {
        return storage.value(forKey: key.rawValue)
    }
    
    func save(value: Any?, key: Keys) {
        storage.setValue(value, forKey: key.rawValue)
    }
    
}
