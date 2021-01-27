//
//  WebView.swift
//  news
//
//  Created by Айдар Чакиев on 27/1/21.
//

import UIKit
import WebKit
class WebView: UIViewController {

    var urlNews = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.load(URLRequest(url: URL(string: urlNews)!))
        // Do any additional setup after loading the view.
    }
    


}
