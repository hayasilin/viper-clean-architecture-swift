//
//  CreatorViewController.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/25.
//

import UIKit
import WebKit

class CreatorViewController: UIViewController {

    var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()

    var activityIndicatorView = UIActivityIndicatorView()
    var loadingView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        view = webView

        webView.load(URLRequest(url: URL(string: "https://github.com/hayasilin")!))
        webView.allowsBackForwardNavigationGestures = true
    }

    func showLoadingIndicator(_ view: UIView) {
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = view.center
        loadingView.clipsToBounds = true
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        loadingView.layer.cornerRadius = 10

        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicatorView.style = .large
        activityIndicatorView.color = .white
        activityIndicatorView.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)

        loadingView.addSubview(activityIndicatorView)
        view.addSubview(loadingView)
        activityIndicatorView.startAnimating()
    }
}

extension CreatorViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showLoadingIndicator(view)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.stopAnimating()
        loadingView.isHidden = true
    }
}

