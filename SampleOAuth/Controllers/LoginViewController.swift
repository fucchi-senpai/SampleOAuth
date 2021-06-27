//
//  LoginViewController.swift
//  SampleOAuth
//
//  Created by Shota Fuchikami on 2021/06/27.
//

import UIKit

protocol LoginViewDelegate {
    func loadSettings(completion: @escaping (Params) -> Void)
}

class LoginViewController: UIViewController {
    
    private var button: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.initViews()
    }
    
    private func initViews() {
        self.initNavigationView()
        self.initButton()
    }
    
    private func initNavigationView() {
        self.navigationItem.title = "Log in"
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func initButton() {
        self.view.addSubview(self.button)
        self.button.setTitle("Log in", for: .normal)
        self.button.backgroundColor = .systemGray
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.addTarget(self, action: #selector(self.onClickButton(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            self.button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3)
        ])
    }
    
    @objc private func onClickButton(_ sender: UIButton) {
        self.loadSettings { requestParams in
            DispatchQueue.main.async {
                let url = "https://github.com/login/oauth/authorize?client_id=\(requestParams.githubClientId)&scope=public_repo"
                self.present(WebViewController(urlInfo: UrlInfo(url: url, type: .open)), animated: true, completion: nil)
            }
        }
    }

}

extension LoginViewController: LoginViewDelegate {
    func loadSettings(completion: @escaping (Params) -> Void) {
        do {
            let settingURL: URL = URL(fileURLWithPath: Bundle.main.path(forResource: "settings", ofType: "plist")!)
            let data = try Data(contentsOf: settingURL)
            let decoder = PropertyListDecoder()
            let requestParams = try decoder.decode(Params.self, from: data)
            completion(requestParams)
        } catch let error {
            print("error: \(error)")
        }
    }
}
