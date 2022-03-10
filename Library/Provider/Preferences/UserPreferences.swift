//
//  UserPreferences.swift
//  Library
//
//  Created by Hamon on 07/03/22.
//

import Foundation
import UIKit

class UserPreferences {
    
    static let USER_NAME = "user_name"
    static let IS_FIRST_TIME = "is_first_time"
    
    private let userPreferences: UserDefaults = UserDefaults.standard
    
    func setProperty(key: String, value: Any) {
        userPreferences.set(value, forKey: key)
    }
    
    func getProperty(key: String) -> Any? {
        return userPreferences.object(forKey: key)
    }
    
}
