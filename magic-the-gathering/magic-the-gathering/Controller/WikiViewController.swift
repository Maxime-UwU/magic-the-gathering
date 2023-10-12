//
//  WikiViewController.swift
//  magic-the-gathering
//
//  Created by coding on 11/10/2023.
//

import UIKit

class WikiViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var cards: [Card] = []
    
    let searchValue = "Creature"
    let searchParameter = "?name="
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true

        if let searchBarTextField = searchBar.value(forKey: "searchField") as? UITextField {
            
            searchBarTextField.textColor = UIColor.lightGray
            
            let placeholderText = "Rechercher une carte"
            let attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray] // Remplacez "UIColor.red" par la couleur de votre choix
            )
            searchBarTextField.attributedPlaceholder = attributedPlaceholder
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        Swift.print("star card list")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let url = URL(string: "https://api.magicthegathering.io/v1/cards" + searchParameter + searchValue)!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                Swift.print(error!.localizedDescription)
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                    if let data = json as? [String: AnyObject] {
                        if let items = data["cards"] as? [[String: AnyObject]] {
                            for item in items {
                                if let card = Card(json: item) {
                                    self.cards.append(card)
                                }
                            }
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        task.resume()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return self.cards.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? CardCollectionViewCell

                let dataItem = self.cards[indexPath.item]
            
            cell?.setup(with: dataItem)

//            cell?.configure(with: dataItem)
            
            print(dataItem)
            
            return cell!
        }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        searchBar.layer.cornerRadius = 10 // Ajustez le rayon en fonction de vos préférences
//        searchBar.layer.masksToBounds = true
//        
//        if let searchBarTextField = searchBar.value(forKey: "searchField") as? UITextField {
//            
//            searchBarTextField.textColor = UIColor.lightGray
//            
//            let placeholderText = "Rechercher une carte"
//            let attributedPlaceholder = NSAttributedString(
//                            string: placeholderText,
//                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray] // Remplacez "UIColor.red" par la couleur de votre choix
//                        )
//            searchBarTextField.attributedPlaceholder = attributedPlaceholder
//            
//            if let searchIcon = searchBarTextField.leftView as? UIImageView {
//                searchIcon.image = UIImage(named: "iconRecherche")
//            }
//        }
//        
//        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    

}


//extension WikiViewController: UICollectionViewDataSource {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//            // #warning Incomplete implementation, return the number of sections
//            return 1
//        }
//  
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        Swift.print(cards.count)
//        return cards.count
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("start cell for itmes")
//        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
//        print("test card cell")
//        cardCell.setup(with: cards[indexPath.row])
//       
//
//        return cardCell
//    }
//}
