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

private let reuseIdentifier = "Cell"

class CardListCollectionViewController: UICollectionViewController {
    
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
//        let config = URLSessionConfiguration.default
//               let session = URLSession(configuration: config)
//               
//               let url = URL(string: "http://api.deezer.com/search?q=a")!
//               
//               let task = session.dataTask(with: url) { (data, response, error) in
//                   if error != nil {
//                       print(error!.localizedDescription)
//                   } else {
//                       if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
//                           if let data = json as? [String: AnyObject] {
//                               
//                               if let items = data["data"] as? [[String: AnyObject]] {
//                                   for item in items {
//                                       //print(item["link"]!)
//                                       //self.browsers.append(item["link"]! as! String)
//                                       if let card = Card(json: item) {
//                                         self.cards.append(card)
//                                       }
//                                       
//                                   }
//                               }
//                           }
//                       }
//                   }
//                   
//                   DispatchQueue.main.async {
//                       self.collectionView.reloadData()
//                   }
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    
    }
//        task.resume()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
}
