//
//  ProfileView.swift
//  SampleOAuth
//
//  Created by Shota Fuchikami on 2021/06/26.
//

import UIKit

class ProfileView: UIView {
    
    private var profile: Profile

    private var vStackView: UIStackView
    private var hStackView: UIStackView
    private var profileImageView: UIImageView
    private var loginName: UILabel
    private var bio: UILabel
    
    init(profile: Profile) {
        self.profile = profile
        self.vStackView = UIStackView()
        self.hStackView = UIStackView()
        self.profileImageView = UIImageView()
        self.loginName = UILabel()
        self.bio = UILabel()
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print(#function)
    }
    
    override func layoutSubviews() {
        updateViews()
    }
    
    func updateViews() {
        initVStackView()
        initHStackView()
        initProfileImageView()
        initUserName()
        initBio()
    }

    private func initVStackView() {
        self.addSubview(self.vStackView)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.addArrangedSubview(hStackView)
        vStackView.addArrangedSubview(bio)
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        NSLayoutConstraint.activate([
            vStackView.heightAnchor.constraint(equalTo: heightAnchor),
            vStackView.widthAnchor.constraint(equalTo: widthAnchor),
            vStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            vStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func initHStackView() {
        hStackView.addArrangedSubview(profileImageView)
        hStackView.addArrangedSubview(loginName)
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.axis = .horizontal
        hStackView.distribution = .fill
        hStackView.alignment = .center
        NSLayoutConstraint.activate([
            hStackView.widthAnchor.constraint(equalTo: vStackView.widthAnchor)
        ])
    }
    
    private func initProfileImageView() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        if let url = self.profile.profileImageUrl {
            self.profileImageView.image = UIImage.load(url: url)
        } else {
            profileImageView.image = UIImage(systemName: "person.circle.fill")
            profileImageView.tintColor = .systemGray
        }
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalTo: hStackView.widthAnchor, multiplier: 0.3),
            profileImageView.topAnchor.constraint(equalTo: hStackView.topAnchor)
        ])
    }
    
    private func initUserName() {
        loginName.translatesAutoresizingMaskIntoConstraints = false
        loginName.text = self.profile.loginName
        loginName.font = UIFont.systemFont(ofSize: 26.0)
        loginName.lineBreakMode = .byTruncatingTail
        loginName.textAlignment = .center
    }
    
    private func initBio() {
        bio.translatesAutoresizingMaskIntoConstraints = false
        bio.text = self.profile.description
        bio.font = UIFont.systemFont(ofSize: 20.0)
        bio.lineBreakMode = .byTruncatingTail
        bio.textAlignment = .center
    }

}
