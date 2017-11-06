//
//  AppDelegate.swift
//  Codeable and UserDefaults
//
//  Created by Louis Tur on 6/29/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let defaults = UserDefaults.standard
        let preferences = ReadingPreference(fontName: "Whatever", fontSize: 12.0, darkMode: true)
        let encodedPreferences = try! PropertyListEncoder().encode(preferences)

        defaults.set(encodedPreferences, forKey: "readingPreferenceKey")

        let encoded = defaults.value(forKey: "readingPreferenceKey") as! Data
        let storedPrefs = try! PropertyListDecoder().decode(ReadingPreference.self, from: encoded)

        print("\n\n\n\n\n\n\n")
        print("Stored Preferences: \n\(storedPrefs.fontName), \(storedPrefs.fontSize), \(storedPrefs.darkMode)")

        if let lastUserEncoded = defaults.value(forKey: "lastUser") as? Data {
            let lastUser = try! PropertyListDecoder().decode(LoggedInUser.self, from: lastUserEncoded)
            print(lastUser.username, lastUser.isPremium, lastUser.lastLogin)
        }
        
		return true
	}
	
}

/*
 Louis Exercises

// store a string
let string = "Hello, World"
defaults.set(string, forKey: "stringKey")

// store a number
let number = 10
defaults.set(number, forKey: "numbersKey")

// store an array
let arr = ["Hello", "World"]
defaults.set(arr, forKey: "arrKey")

// store a dict
let dict = ["Hello" : "World"]
defaults.set(dict, forKey: "dictKey")

// retrieve a string
if let aString = defaults.value(forKey: "stringKey") as? String {
    print("String Retrieved: \(aString)")
}

// retrieve a number
if let aNumber = defaults.value(forKey: "numbersKey") as? Int {
    print("Number Retrieved: \(aNumber)")
}

// retrieve an array
if let aArr = defaults.value(forKey: "arrKey") as? [String] {
    print("Array Retrieved: \(aArr)")
}

// retrieve a dict
if let aDict = defaults.value(forKey: "dictKey") as? [String:String] {
    print("Dictionary Retrieved: \(aDict)")
}

// 1.
let numbersArr = [2, 4, 5, 6, 7, 10]
defaults.set(numbersArr, forKey: "numbersArrKey")
if let numArr = defaults.value(forKey: "numbersArrKey") as? [Int] {
    print("Array Retrieved: \(numArr)")
}

// 2.
let dates = [Date(), Date(), Date(), Date()]
defaults.set(dates, forKey: "datesKey")
if let dates = defaults.value(forKey: "datesKey") as? [Date] {
    print("Dates Retrieved: \(dates)")
}

// 3.
let largerDict = [
    "name" : "Louis",
    "cats_name" : "Miley",
    "location" : "Queens"
]
defaults.set(largerDict, forKey: "largerDictKey")
if let largerDicts = defaults.value(forKey: "largerDictKey") as? [String : String] {
    print("Dict Retrieved: \(largerDicts)")
}

// 4.
let mixedTypeDict: [String : Any] = [
    "name" : "Miley",
    "breed" : "American Shorthair",
    "age" : 5
]
defaults.set(mixedTypeDict, forKey: "mixedTypeDictKey")
if let mixed = defaults.value(forKey: "mixedTypeDictKey") as? [String : Any] {
    print("Dict Retrieved: \(mixed)")
}

// 5.
let nestedArray = [
    [1, 2, 3, 4, 5],
    [10, 20, 30, 40, 50],
    [11, 12, 13, 14]
]
defaults.set(nestedArray, forKey: "nestedArrayKey")
if let nested = defaults.value(forKey: "nestedArrayKey") as? [[Int]] {
    print(nested)
}

// 6.
let nestedDictionary = [
    "cat" : [
        "name" : "Miley"
    ],

    "dog" : [
        "name" : "Spot"
    ]
]
defaults.set(nestedDictionary, forKey: "nestedDictKey")
if let nested = defaults.value(forKey: "nestedDictKey") as? [String : [String : String]] {
    print(nested)
}

// 7.
let nestedStructure = [
    "cats" : [
        [     "name" : "Miley",
              "age"  : 5 ],
        [    "name" : "Bale",
             "age" : 14]
    ]
]
defaults.set(nestedStructure, forKey: "nestedStructureKey")
if let nested = defaults.value(forKey: "nestedStructureKey") as? [String : [[String: Any]]] {
    print("Nested Dict Retrived: \(nested)")
}

// 8. ~~ Advanced ~~
let advancedStructure: [String : Any] = [
    "cats" : [
        [    "name" : "Miley",
             "age"  : 5         ],
        [    "name" : "Bale",
             "age" : 14        ]    ],

    "dogs" : [
        [    "breed" : "Basset Hound",
             "age"  : 7     ],
        [    "breed" : "Greyhound",
             "age" : 3    ]    ],

    "stats" : [
        "scale" : "miles",
        "distance_to_sun" : 92.96,
        "distance_to_moon" : 238900
    ]
]
defaults.set(advancedStructure, forKey: "advancedStructureKey")
if let deluxe = defaults.value(forKey: "advancedStructureKey") as? [String : Any] {
    print("ARGH: \(deluxe)")
}
*/
