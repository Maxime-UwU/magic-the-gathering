//
//  boosterOpenViewController.swift
//  magic-the-gathering
//
//  Created by coding on 13/10/2023.
//

import UIKit

class boosterOpenViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var booster: [Card] = []
    @IBOutlet weak var newCardTab: UITableView!
    var code: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newCardTab.dataSource = self
        newCardTab.delegate = self
        openBooster(setCode: code)
        // Do any additional setup after loading the view.
        func openBooster(setCode: String){
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let url = URL(string: "https://api.magicthegathering.io/v1/sets/\(setCode)/booster")!
            
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    
                    if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                        if let data = json as? [String: AnyObject] {
                            if let items = data["cards"] as? [[String: AnyObject]] {
                                for item in items {
                                    if let card = Card(json: item) {
                                        self.booster.append(card)
                                    }
                                }
                              //  print(self.booster)
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.newCardTab.reloadData()
                    }
                }
            }
            dataTask.resume()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.booster.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newCardCell", for: indexPath)
       // print (cell)
        cell.textLabel?.text = self.booster[indexPath.row].name
        
        return cell
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
