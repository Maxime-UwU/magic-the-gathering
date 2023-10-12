//
//  WebViewController.swift
//  test2
//
//  Created by Maxime NICOLAS on 10/10/2023.
//

import UIKit
import WebKit

class WikiWebViewController: UIViewController {

    
    @IBOutlet weak var WebView: WKWebView!
    @IBOutlet weak var textField: UITextField!
    var linkBrowser = "https://gatherer.wizards.com/Pages/Default.aspx"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.reloadWebView(text: self.linkBrowser)
        
        self.textField.text = self.linkBrowser
        // Do any additional setup after loading the view.
        
    }
    
    func reloadWebView(text: String){
        let url = URL(string: text)!
        let request = URLRequest(url: url)
        self.WebView.load(request)

    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Zoom the webpage when it's finished loading
        webView.scrollView.setZoomScale(1.5, animated: true) // Adjust the zoom scale as needed
    }
    
    @IBAction func goAction(_ sender: Any) {
        self.reloadWebView(text: self.textField.text!)
    }
    
    @IBAction func closeTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
