//
//  Card.swift
//  magic-the-gathering
//
//  Created by Vahé Krikorian on 11/10/2023.
//

import Foundation

struct Card {
    let name: String
}

extension Card {
    init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String
        else {
            return nil
        }
        self.name = name
    }
}


