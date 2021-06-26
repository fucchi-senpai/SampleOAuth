//
//  WebViewController.swift
//  SampleOAuth
//
//  Created by Shota Fuchikami on 2021/06/26.
//

import UIKit
import WebKit

protocol WebViewControllerDelegate {
    func fallbackOAuth(url: URL)
}

class WebViewController: UIViewController, WKUIDelegate {
    
    private var webView: WKWebView?
    private var urlInfo: UrlInfo
    
    init(urlInfo: UrlInfo) {
        self.urlInfo = urlInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initWebView()
        let myURL = URL(string: self.urlInfo.url)
        let myRequest = URLRequest(url: myURL!)
        self.webView?.load(myRequest)
    }
    
    private func initWebView() {
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        guard let webView = self.webView else { return }
        self.view.addSubview(webView)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            webView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }

}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            return
        }
        switch self.urlInfo.type {
        case .oauth:
            self.dismiss(animated: true, completion: nil)
            self.fallbackOAuth(url: url)
        default:
            print("url: \(self.urlInfo.url)")
        }
        decisionHandler(WKNavigationActionPolicy.allow)
    }
}

extension WebViewController: WebViewControllerDelegate {
    func fallbackOAuth(url: URL) {
        // TODO: Not Implementation
    }
}
