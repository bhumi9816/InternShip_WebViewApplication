//
//  ViewController.swift
//  WebViewApplication
//
//  Created by Bhumi Patel on 6/29/20.
//  Copyright © 2020 Bhumi Patel. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    
    //@IBOutlet var webView: WKWebView!

    
    @IBOutlet weak var Web_View: WKWebView!
    
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //setting up the capabilities for our webview, having an URL as a string and load that up in our web view
        
        let url_link = URL(string: "http://www.google.com")
        let url_request = URLRequest(url: url_link!)
        
        Web_View.load(url_request)
        
        //still we need to give permission to load up any external websites.
        
        
        Web_View.addSubview(ActivityIndicator)
        
        //starts to show the indicator to the user
        ActivityIndicator.startAnimating()
        
        Web_View.navigationDelegate = self
        ActivityIndicator.hidesWhenStopped = true
        
        
    }

    @IBAction func BackButton(_ sender: Any) {
        
        if Web_View.canGoBack {
            
            Web_View.goBack()
        }
        
    }
    
    
    @IBAction func ForwardButton(_ sender: Any) {
        
        if Web_View.canGoForward {
            
            Web_View.goForward()
        }
        
    }
    
    
    @IBAction func RefreshButton(_ sender: Any) {
        
        Web_View.reload()
        
    }
    
    
    @IBAction func StopButton(_ sender: Any) {
        
        Web_View.stopLoading()
        
    }
    
    
    //to make sure that the indicator appears whenever the site loads up and disappers
    
    //allows to go back and forth and loops between the function
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        ActivityIndicator.startAnimating()
    }
    
    //two functions for our web_view
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //once it loads up the web page we want to stop showing
        
        ActivityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ActivityIndicator.stopAnimating()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //triggers an action if a search bar is clicked
        
        
        //step1: get the search bar
        searchBar.resignFirstResponder()
        
        let url_link = URL(string: "http://\(searchBar.text!)")
        let url_request = URLRequest(url: url_link!)
        
        Web_View.load(url_request)
        
    }
    
}

