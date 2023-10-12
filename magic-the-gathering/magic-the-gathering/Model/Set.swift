//
//  Set.swift
//  magic-the-gathering
//
//  Created by coding on 12/10/2023.
//

import Foundation


struct Set {
    let code: String
    let name: String
    let booster: [String]
}

extension Set {
    init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String,
              let code = json["code"] as? String,
              let booster = json["booster"] as? [String]
        else {
            return nil
        }
        self.name = name
        self.code = code
        self.booster = booster
    }
}
