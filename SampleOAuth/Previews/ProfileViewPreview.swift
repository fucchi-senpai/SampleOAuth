//
//  ProfileViewPreview.swift
//  SampleOAuth
//
//  Created by Shota Fuchikami on 2021/06/26.
//

import SwiftUI

struct ProfileViewPreview_Previews: PreviewProvider {
    struct Wrapper: UIViewRepresentable {
        
        private let profile: Profile
        
        init(profile: Profile) {
            self.profile = profile
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {
            guard let view = uiView as? ProfileView else { return }
            view.updateViews()
        }
        
        func makeUIView(context: Context) -> some UIView {
            return ProfileView(profile: self.profile)
        }
    }
    
    static var previews: some View {
        Group {
            Wrapper(
                profile: Profile(profileImageUrl: "https://avatars.githubusercontent.com/u/53225198?v=4",loginName: "fucchi-senpai",description: "iOS Engineer"))
                .previewDisplayName("通常レイアウト")
            
            Wrapper(
                profile: Profile(loginName: "fucchi-senpai",description: "iOS Engineer"))
                .previewDisplayName("プロフィール画像なし")
        }
        .previewLayout(.fixed(width: 390, height: 390 * 0.6))
    }
}
