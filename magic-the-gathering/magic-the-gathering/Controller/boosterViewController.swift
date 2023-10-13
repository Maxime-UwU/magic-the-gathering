//
//  boosterViewController.swift
//  magic-the-gathering
//
//  Created by coding on 11/10/2023.
//

import UIKit

class boosterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var sets: [Set] = []
    var booster: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://api.magicthegathering.io/v1/sets")!
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
 
            if error != nil {
                print(error!.localizedDescription)
            } else {
 
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                    if let data = json as? [String: AnyObject] {
                        if let items = data["sets"] as? [[String: AnyObject]] {
                            for item in items {
                                if let set = Set(json: item) {
                                    self.sets.append(set)
                                }
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        dataTask.resume()
            
            // Do any additional setup after loading the view.
        
    }
    
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
                        }
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.sets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
       // print (cell)
        cell.textLabel?.text = self.sets[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "boosterView") as? boosterOpenViewController{
           print("test did select")
            vc.code = self.sets[indexPath.row].code
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
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
