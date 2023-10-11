//
//  Cards.swift
//  magic-the-gathering
//
//  Created by coding on 11/10/2023.
//

import Foundation

struct Card: Codable {
   
}


extension Card {
    init?(json: [String: AnyObject]) {
        guard let name = json["title"] as? String,
              let url = json["link"] as? String,
              let _ = json["duration"] as? Int
        else { return nil }
        
     //   self.name = name
     //   self.urlPage = url
    }
}
