//
//  Booster.swift
//  magic-the-gathering
//
//  Created by coding on 11/10/2023.
//

import Foundation
 
struct Boosters: Codable {
    var cards: [Card]
    
}


extension Boosters {
    init?(json: [[String: AnyObject]]) {
        
    }
}
