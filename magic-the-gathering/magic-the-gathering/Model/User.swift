//
//  User.swift
//  magic-the-gathering
//
//  Created by Maxime NICOLAS on 11/10/2023.
//

import Foundation

struct Users: Codable {
    var users: [User]
}

struct User: Codable {
    var username: String
    var password: String
}
