import UIKit

class WikiViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var cards: [Card] = []
    
    var searchValue: String = ""
    
    var selectedSearchOption: Int = 0 
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        updateSearchResults()
        searchBar.delegate = self
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
        
    }
    
    var searchTimer: Timer?

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Réinitialisez le minuteur si l'utilisateur continue de taper
        searchTimer?.invalidate()
        
        // Définissez un délai de recherche de 0.5 seconde (par exemple)
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] timer in
            guard let self = self else { return }
            self.searchValue = searchText
            print(self.searchValue)
            
            // Réinitialisez le tableau de cartes
            self.cards = []
            
            // Mettez à jour la recherche dans la file d'attente principale
            DispatchQueue.main.async {
                self.updateSearchResults()
            }
        }
    }
    
    func updateSearchResults() {
        var searchParam: String
        switch selectedSearchOption {
        case 0:
            searchParam = "?name="
        case 1:
            searchParam = "?type="
//        case 2:
//            searchParam = "autre"
        default:
            searchParam = "?name=" // Par défaut, recherche par nom
        }
        
        Swift.print("star card list")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let url = URL(string: "https://api.magicthegathering.io/v1/cards" + searchParam + self.searchValue)!
        
        print("param :" + searchParam + "" + self.searchValue)
        print(url)
        
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
    
    
    @IBAction func searchOptionChanged(_ sender: UISegmentedControl) {
        selectedSearchOption = sender.selectedSegmentIndex
            // Appeler la fonction pour mettre à jour la recherche ici
            updateSearchResults()
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
            
//            print(dataItem)
            
            return cell!
        }
    
        
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "webview") as? WikiWebViewController {
            
            vc.linkBrowser = self.cards[indexPath.item].urlPage
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
        
    }
