import UIKit
import WebKit

class CollecWebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textField: UITextField!
    var linkBrowser = "https://gatherer.wizards.com/Pages/Default.aspx"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the delegate to self to use WKNavigationDelegate methods
        webView.navigationDelegate = self

        // Load the URL
        self.reloadWebView(text: self.linkBrowser)
        self.textField.text = self.linkBrowser
    }

    func reloadWebView(text: String) {
        guard let url = URL(string: text) else {
            return
        }
        let request = URLRequest(url: url)
        self.webView.load(request)
    }

    // WKNavigationDelegate method to be notified when the page has finished loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Zoom the webpage to fit the content
        webView.scrollView.setZoomScale(webView.scrollView.minimumZoomScale, animated: true)
    }

    @IBAction func goAction(_ sender: Any) {
        self.reloadWebView(text: self.textField.text!)
    }

    @IBAction func closeTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
