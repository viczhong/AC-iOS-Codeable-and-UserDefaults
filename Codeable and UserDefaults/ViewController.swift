//
//  ViewController.swift
//  Codeable and UserDefaults
//
//  Created by Louis Tur on 6/29/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    let user = LoggedInUser(username: "Vic", isPremium: true, lastLogin: Date())

    override func viewDidLoad() {
        super.viewDidLoad()

        let userEncoded = try! PropertyListEncoder().encode(user)
        defaults.set(userEncoded, forKey: "lastUser")
    }




}

