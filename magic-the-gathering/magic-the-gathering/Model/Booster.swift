//
//  Booster.swift
//  magic-the-gathering
//
//  Created by coding on 12/10/2023.
//

import Foundation

struct Booster {
    let cards : [Card]
}

extension Booster {
    init?(json: [String: AnyObject]) {
        guard let cards = json["cards"] as? [Card]
        else {
            return nil
        }
        self.cards = cards
    }
}

