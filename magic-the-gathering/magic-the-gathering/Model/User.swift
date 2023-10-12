//
//  User.swift
//  magic-the-gathering
//
//  Created by Maxime NICOLAS on 11/10/2023.
//

import Foundation

struct Users {
    var users: [User]
}

var currentUser = User(username: "", password: "", cardsCollection: [])

struct User {
    var username: String
    var password: String
    var cardsCollection: [Card]
}
