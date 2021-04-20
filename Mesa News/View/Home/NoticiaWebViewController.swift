//
//  NoticiaWebViewController.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 20/04/21.
//

import UIKit
import WebKit

class NoticiaWebViewController: UIViewController {
    
    var webView: WKWebView!
    var coordinator: HomeCoordinator?
    var urlNoticia: String = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let btnCompartilharEvento = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(compartilharNoticia)
        )
                
        self.navigationItem.rightBarButtonItem = btnCompartilharEvento
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.App.name

        showLoading("por_favor_aguarde".translate)
        
        if let url = URL(string: urlNoticia) {
            webView.load(URLRequest(url: url))
            webView.navigationDelegate = self
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    
    @objc func compartilharNoticia(){
        
        let activityViewController = UIActivityViewController(
            activityItems:  [urlNoticia],
            applicationActivities: nil
        )
        
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.copyToPasteboard,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToVimeo
        ]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension NoticiaWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoading()
    }
}
