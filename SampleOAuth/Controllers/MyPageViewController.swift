//
//  MyPageViewController.swift
//  SampleOAuth
//
//  Created by Shota Fuchikami on 2021/06/26.
//

import UIKit

protocol MyPageViewControllerDelegate {
    func load(url: String, completion: @escaping (Data) -> Void)
}

class MyPageViewController: UIViewController {
    
    private var profileView: ProfileView
    
    init(profileView: ProfileView) {
        self.profileView = profileView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.initViews()
    }
    
    private func initViews() {
        initProfileView()
    }
    
    private func initProfileView() {
        // TODO: Not Implementation
    }

}

extension MyPageViewController: MyPageViewControllerDelegate {
    func load(url: String, completion: @escaping (Data) -> Void) {
        // TODO: Not Implementation
    }
}
