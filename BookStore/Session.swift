//
//  Session.swift
//  BookStore
//
//  Created by George Predan on 22.11.2022.
//

import Foundation

struct Session {
    @UserDefault(key: "didInstallApp", defaultValue: false)
    static var didInstallApp: Bool
}

@propertyWrapper
struct UserDefault<T> {
    
    var key: String
    var defaultValue: T
    
    var wrappedValue: T {
        get {
            let value = UserDefaults.standard.value(forKey: key) as? T
            return value ?? defaultValue
        } set {
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
}
