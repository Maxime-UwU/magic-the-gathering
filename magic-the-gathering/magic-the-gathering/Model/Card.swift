//
//  Card.swift
//  magic-the-gathering
//
//  Created by Vahé Krikorian on 11/10/2023.
//

import Foundation

struct Card {
    let name: String
    let urlPage: String
    let imageUrl: String
    let multiverseId : String
}

struct Gatherer {
    let name: String

    
    }
let url = "https://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid="

extension Card {
    init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String,
              let imageUrl = json["imageUrl"] as? String,
              let cardId = json["multiverseid"] as? String

                
        else {
            return nil
        }
        self.name = name
        self.multiverseId = cardId
        self.urlPage = url + cardId
        self.imageUrl = imageUrl
    }
}


