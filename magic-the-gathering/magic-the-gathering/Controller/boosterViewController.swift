//
//  boosterViewController.swift
//  magic-the-gathering
//
//  Created by coding on 11/10/2023.
//

import UIKit

class boosterViewController: UIViewController {
    
    var sets: [Set] = []
    var booster: [Card] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                            print(self.sets)
                        }
                    }
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
                            print(self.booster)
                        }
                    }
                }
            }
        }
        dataTask.resume()
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
