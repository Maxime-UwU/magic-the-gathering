//
//  CardCollectionViewCell.swift
//  magic-the-gathering
//
//  Created by Vahé Krikorian on 12/10/2023.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
        @IBOutlet weak var nameLabel: UILabel!
        
        func setup(with card: Card) {
            nameLabel.text = card.name
        }

}
