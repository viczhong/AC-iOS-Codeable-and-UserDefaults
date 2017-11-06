//
//  ReadingPreferences.swift
//  Codeable and UserDefaults
//
//  Created by Victor Zhong on 11/2/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import Foundation

class ReadingPreference: Codable {
    var fontName: String
    var fontSize: Float
    var darkMode: Bool

    init(fontName: String, fontSize: Float, darkMode: Bool) {
        self.fontName = fontName
        self.fontSize = fontSize
        self.darkMode = darkMode
    }
}
