//
//  LoggedInUser.swift
//  Codeable and UserDefaults
//
//  Created by Victor Zhong on 11/2/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import Foundation

class LoggedInUser: Codable {
    var username: String
    var isPremium: Bool // if the user has a paid subscription
    var lastLogin: Date

    init(username: String, isPremium: Bool, lastLogin: Date) {
        self.username = username
        self.isPremium = isPremium
        self.lastLogin = lastLogin
    }
}
