//
//  WikiViewController.swift
//  magic-the-gathering
//
//  Created by coding on 11/10/2023.
//

import UIKit

class WikiViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.layer.cornerRadius = 10 // Ajustez le rayon en fonction de vos préférences
        searchBar.layer.masksToBounds = true
        
        if let searchBarTextField = searchBar.value(forKey: "searchField") as? UITextField {
            
            searchBarTextField.textColor = UIColor.lightGray
            
            let placeholderText = "Rechercher une carte"
            let attributedPlaceholder = NSAttributedString(
                            string: placeholderText,
                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray] // Remplacez "UIColor.red" par la couleur de votre choix
                        )
            searchBarTextField.attributedPlaceholder = attributedPlaceholder
            
            if let searchIcon = searchBarTextField.leftView as? UIImageView {
                searchIcon.image = UIImage(named: "iconRecherche")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

