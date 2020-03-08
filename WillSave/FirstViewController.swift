//
//  FirstViewController.swift
//  WillSave
//
//  Created by alvin on 3/8/20.
//  Copyright © 2020 Ice Nine Labs. All rights reserved.
//

import UIKit

import SafariServices
import WebKit

class FirstViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.navigationDelegate = self
        let url = URL(string:"https://alvinkerber.net")
        webView.load(URLRequest(url: url!))
    }
    
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        if navigationAction.navigationType == .linkActivated {
            if let url = navigationAction.request.url {
                let svc = SFSafariViewController(url: url)
                self.present(svc, animated: true)
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

